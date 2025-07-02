import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tao_phieu_nhap_kho_controller.dart';
import 'custom_text_from_field.dart';

class ChiTietItemForm extends GetView<TaoPhieuNhapKhoController> {
  const ChiTietItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.chiTietFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: controller.editingTenSanPhamController,
            labelText: 'Tên Sản Phẩm',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tên SP không được để trống';
              }
              return null;
            },
          ),
          CustomTextField(
              controller: controller.editingMaSoController, labelText: 'Mã Số'),
          CustomTextField(
              controller: controller.editingDonViController,
              labelText: 'Đơn Vị'),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: controller.editingSoLuongChungTuController,
                  labelText: 'SL Chứng Từ',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  controller: controller.editingSoLuongThucNhapController,
                  labelText: 'SL Thực Nhập',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: controller.editingDonGiaController,
                  labelText: 'Đơn Giá',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  controller: controller.editingThanhTienController,
                  labelText: 'Thành Tiền',
                  readOnly: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Obx(() => ElevatedButton.icon(
                onPressed: controller.addOrUpdateChiTietItem,
                icon: Icon(controller.editingItemIndex.value == null
                    ? Icons.add
                    : Icons.update),
                label: Text(controller.editingItemIndex.value == null
                    ? 'Thêm Chi Tiết Hàng'
                    : 'Cập Nhật Chi Tiết Hàng'),
              )),
          Obx(() => controller.editingItemIndex.value !=
                  null // Show cancel button only when editing
              ? TextButton(
                  onPressed: controller.resetEditingChiTietItem,
                  child: const Text('Hủy Bỏ Chỉnh Sửa'),
                )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
