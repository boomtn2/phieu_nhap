import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phieu_nhap/core/domain/entity/chi_tiet_nhap_kho.dart';
import 'package:phieu_nhap/core/domain/entity/phieu_nhap_kho.dart';
import 'package:phieu_nhap/core/domain/use_case/create_phieu_nhap_kho.dart';

import '../../core/presentation/controller.dart';
import 'widgets/confirm_view.dart';

class TaoPhieuNhapKhoController extends Controller {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> chiTietFormKey = GlobalKey<FormState>();

  // Observable variables for general receipt information
  final TextEditingController soPhieuController = TextEditingController();
  final TextEditingController ngayLapController = TextEditingController();
  final TextEditingController donViController = TextEditingController();
  final TextEditingController boPhanController = TextEditingController();
  final TextEditingController noController = TextEditingController();
  final TextEditingController coController = TextEditingController();
  final TextEditingController hoTenNguoiGiaoController =
      TextEditingController();
  final TextEditingController lyDoNhapController = TextEditingController();
  final TextEditingController diaDiemNhapController = TextEditingController();
  final TextEditingController soChungTuGocController = TextEditingController();
  final TextEditingController tongSoTienController = TextEditingController();
  final TextEditingController nguoiLapPhieuController = TextEditingController();
  final TextEditingController nguoiGiaoHangController = TextEditingController();
  final TextEditingController thuKhoController = TextEditingController();
  final TextEditingController keToanTruongController = TextEditingController();

  // Observable list for item details
  var chiTietItems = <ChiTietNhapKhoEntity>[].obs;

  // Observable for temporary item being edited/added
  var editingChiTietItem = ChiTietNhapKhoEntity().obs;
  var editingItemIndex =
      Rx<int?>(null); // Null if adding new, index if editing existing

  // Text controllers for the currently editing ChiTietItem
  final TextEditingController editingTenSanPhamController =
      TextEditingController();
  final TextEditingController editingMaSoController = TextEditingController();
  final TextEditingController editingDonViController = TextEditingController();
  final TextEditingController editingSoLuongChungTuController =
      TextEditingController();
  final TextEditingController editingSoLuongThucNhapController =
      TextEditingController();
  final TextEditingController editingDonGiaController = TextEditingController();
  final TextEditingController editingThanhTienController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
    ngayLapController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _addEditingItemListeners();
    ever(
        chiTietItems,
        (_) =>
            _calculateTongSoTien()); // Recalculate total whenever items change
  }

  @override
  void onClose() {
    // Dispose all controllers
    soPhieuController.dispose();
    ngayLapController.dispose();
    donViController.dispose();
    boPhanController.dispose();
    noController.dispose();
    coController.dispose();
    hoTenNguoiGiaoController.dispose();
    lyDoNhapController.dispose();
    diaDiemNhapController.dispose();
    soChungTuGocController.dispose();
    tongSoTienController.dispose();
    nguoiLapPhieuController.dispose();
    nguoiGiaoHangController.dispose();
    thuKhoController.dispose();
    keToanTruongController.dispose();

    _removeEditingItemListeners();

    editingTenSanPhamController.dispose();
    editingMaSoController.dispose();
    editingDonViController.dispose();
    editingSoLuongChungTuController.dispose();
    editingSoLuongThucNhapController.dispose();
    editingDonGiaController.dispose();
    editingThanhTienController.dispose();

    super.onClose();
  }

  void _addEditingItemListeners() {
    editingSoLuongThucNhapController.addListener(_calculateEditingThanhTien);
    editingDonGiaController.addListener(_calculateEditingThanhTien);
  }

  void _removeEditingItemListeners() {
    editingSoLuongThucNhapController.removeListener(_calculateEditingThanhTien);
    editingDonGiaController.removeListener(_calculateEditingThanhTien);
  }

  void _calculateEditingThanhTien() {
    double soLuong =
        double.tryParse(editingSoLuongThucNhapController.text) ?? 0.0;
    double donGia = double.tryParse(editingDonGiaController.text) ?? 0.0;
    editingThanhTienController.text = (soLuong * donGia).toStringAsFixed(0);
    // Update the observable editingChiTietItem to trigger UI refresh for thanhTien
    editingChiTietItem.update((val) {
      val = val!.copyWith(
          thanhTien: double.tryParse(editingThanhTienController.text));
    });
  }

  void _updateEditingChiTietItemFromControllers() {
    editingChiTietItem.value = ChiTietNhapKhoEntity(
      tenSanPham: editingTenSanPhamController.text,
      maSo: editingMaSoController.text,
      donVi: editingDonViController.text,
      soLuongChungTu: int.tryParse(editingSoLuongChungTuController.text),
      soLuongThucNhap: int.tryParse(editingSoLuongThucNhapController.text),
      donGia: double.tryParse(editingDonGiaController.text),
      thanhTien: double.tryParse(editingThanhTienController.text),
    );
  }

  void _populateControllersFromEditingItem() {
    editingTenSanPhamController.text = '${editingChiTietItem.value.tenSanPham}';
    editingMaSoController.text = '${editingChiTietItem.value.maSo}';
    editingDonViController.text = '${editingChiTietItem.value.donVi}';
    editingSoLuongChungTuController.text =
        '${editingChiTietItem.value.soLuongChungTu}';
    editingSoLuongThucNhapController.text =
        '${editingChiTietItem.value.soLuongThucNhap}';
    editingDonGiaController.text = '${editingChiTietItem.value.donGia}';
    editingThanhTienController.text = '${editingChiTietItem.value.thanhTien}';
  }

  void addOrUpdateChiTietItem() {
    if (chiTietFormKey.currentState!.validate()) {
      _updateEditingChiTietItemFromControllers();

      if (editingItemIndex.value == null) {
        // Add new item
        chiTietItems.add(editingChiTietItem.value);
      } else {
        // Update existing item
        chiTietItems[editingItemIndex.value!] = editingChiTietItem.value;
      }
      resetEditingChiTietItem();
    }
  }

  void editChiTietItem(int index) {
    editingItemIndex.value = index;
    editingChiTietItem.value = chiTietItems[index];
    _populateControllersFromEditingItem();
  }

  void removeChiTietItem(int index) {
    chiTietItems.removeAt(index);
    if (editingItemIndex.value == index) {
      resetEditingChiTietItem();
    } else if (editingItemIndex.value != null &&
        editingItemIndex.value! > index) {
      editingItemIndex.value = editingItemIndex.value! - 1;
    }
  }

  void resetEditingChiTietItem() {
    editingItemIndex.value = null;
    editingChiTietItem.value = ChiTietNhapKhoEntity();
    editingTenSanPhamController.clear();
    editingMaSoController.clear();
    editingDonViController.clear();
    editingSoLuongChungTuController.clear();
    editingSoLuongThucNhapController.clear();
    editingDonGiaController.clear();
    editingThanhTienController.clear();
  }

  void _calculateTongSoTien() {
    double total = 0.0;
    for (var item in chiTietItems) {
      total += item.thanhTien ?? 0.0;
    }
    tongSoTienController.text = total.toStringAsFixed(0);
  }

  final CreatePhieuNhapKho _createPhieuNhapKhocreate =
      Get.find<CreatePhieuNhapKho>();
  bool loading = false;

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      Get.dialog(Dialog(child: ConfirmationView()));
    }
  }

  void confirmSubmit() {
    if (loading) {
      Get.snackbar(
        'Xin lòng đợi!',
        'Có tiền trình khác đang được thực hiện.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      return;
    }
    if (formKey.currentState!.validate()) {
      loading = true;
      final PhieuNhapKhoEntity phieuNhap = PhieuNhapKhoEntity(
          soPhieu: soPhieuController.text,
          ngayLap: DateTime.tryParse(ngayLapController.text) ?? DateTime.now(),
          donVi: donViController.text,
          boPhan: boPhanController.text,
          no: noController.text,
          co: coController.text,
          hoTenNguoiGiao: hoTenNguoiGiaoController.text,
          lyDoNhap: lyDoNhapController.text,
          diaDiemNhap: diaDiemNhapController.text,
          soChungTuGoc: int.tryParse(soChungTuGocController.text) ?? 0,
          tongSoTien: double.tryParse(tongSoTienController.text) ?? 0.0,
          nguoiLapPhieu: nguoiLapPhieuController.text,
          nguoiGiaoHang: nguoiGiaoHangController.text,
          thuKho: thuKhoController.text,
          keToanTruong: keToanTruongController.text,
          chiTiet: chiTietItems);

      consumeState(_createPhieuNhapKhocreate.call(phieuNhap),
          onSuccess: (value) {
        value.fold(
          (failure) {
            Get.snackbar(
              'Lỗi',
              'Không thể lưu dữ liệu: ${failure.value}',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          },
          (success) {
            Get.snackbar(
              'Thành công',
              'Dữ liệu đã được lưu thành công!',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
            clearForm();
          },
        );
      });
      loading = false;
    }
  }

  void clearForm() {
    formKey.currentState?.reset();
    soPhieuController.clear();
    ngayLapController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    donViController.clear();
    boPhanController.clear();
    noController.clear();
    coController.clear();
    hoTenNguoiGiaoController.clear();
    lyDoNhapController.clear();
    diaDiemNhapController.clear();
    soChungTuGocController.clear();
    tongSoTienController.clear();
    nguoiLapPhieuController.clear();
    nguoiGiaoHangController.clear();
    thuKhoController.clear();
    keToanTruongController.clear();
    chiTietItems.clear();
    resetEditingChiTietItem();
  }
}
