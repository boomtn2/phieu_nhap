import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phieu_nhap/feature/tao_phieu_nhap_kho/tao_phieu_nhap_kho_controller.dart';
import 'package:phieu_nhap/feature/tao_phieu_nhap_kho/widgets/chi_tiet_phieu_nhap_from.dart';
import 'package:phieu_nhap/feature/tao_phieu_nhap_kho/widgets/custom_text_from_field.dart';

import 'widgets/table_chi_tiet_san_pham.dart';

class TaoPhieuNhapKhoPage extends GetView<TaoPhieuNhapKhoController> {
  const TaoPhieuNhapKhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Nhập Phiếu Nhập Kho'),
        // ),
        body: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Thông tin Phiếu Nhập Kho',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: controller.soPhieuController,
                  labelText: 'Số Phiếu',
                ),
                CustomTextField(
                  controller: controller.ngayLapController,
                  labelText: 'Ngày Lập',
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      controller.ngayLapController.text =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                    }
                  },
                ),
                CustomTextField(
                    controller: controller.donViController,
                    labelText: 'Đơn Vị'),
                CustomTextField(
                    controller: controller.boPhanController,
                    labelText: 'Bộ Phận'),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            controller: controller.noController,
                            labelText: 'Nợ')),
                    const SizedBox(width: 10),
                    Expanded(
                        child: CustomTextField(
                            controller: controller.coController,
                            labelText: 'Có')),
                  ],
                ),
                CustomTextField(
                    controller: controller.hoTenNguoiGiaoController,
                    labelText: 'Họ Tên Người Giao'),
                CustomTextField(
                    controller: controller.lyDoNhapController,
                    labelText: 'Lý Do Nhập'),
                CustomTextField(
                    controller: controller.diaDiemNhapController,
                    labelText: 'Địa Điểm Nhập'),
                const SizedBox(height: 16),
                Divider(),
                const Text(
                  'Nhập Chi Tiết Hàng',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),
                const ChiTietItemForm(),
                // Widget for adding/editing item details
                const SizedBox(height: 30),
                TableChiTietSanPham(),
                const SizedBox(height: 30),
                Divider(),
                CustomTextField(
                  controller: controller.soChungTuGocController,
                  labelText: 'Số Chứng Từ Gốc',
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  controller: controller.tongSoTienController,
                  labelText: 'Tổng Số Tiền',
                  readOnly: true,
                ),

                const SizedBox(height: 30),
                Divider(),
                CustomTextField(
                    controller: controller.nguoiLapPhieuController,
                    labelText: 'Người Lập Phiếu'),
                CustomTextField(
                    controller: controller.nguoiGiaoHangController,
                    labelText: 'Người Giao Hàng'),
                CustomTextField(
                    controller: controller.thuKhoController,
                    labelText: 'Thủ Kho'),
                CustomTextField(
                    controller: controller.keToanTruongController,
                    labelText: 'Kế Toán Trưởng'),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: controller.submitForm,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'Lưu Phiếu Nhập Kho',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
