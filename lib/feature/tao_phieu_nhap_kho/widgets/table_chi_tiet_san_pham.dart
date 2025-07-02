import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phieu_nhap/feature/tao_phieu_nhap_kho/tao_phieu_nhap_kho_controller.dart';

class TableChiTietSanPham extends GetView<TaoPhieuNhapKhoController> {
  const TableChiTietSanPham({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Danh Sách Hàng Nhập',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Obx(
          () => controller.chiTietItems.isEmpty
              ? const Center(
                  child: Text('Chưa có chi tiết hàng nhập nào.',
                      style: TextStyle(fontStyle: FontStyle.italic)))
              : SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade400, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      headingRowColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) => Colors.grey[200]),
                      columnSpacing: 12.0,
                      horizontalMargin: 10,
                      dataRowMinHeight: 40,
                      dataRowMaxHeight: 60,
                      columns: const [
                        DataColumn(
                            label: Text('STT',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Tên SP',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Mã Số',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Đơn Vị',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('SL CT',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('SL Thực',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Đơn Giá',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Thành Tiền',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Thao Tác',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: List<DataRow>.generate(
                        controller.chiTietItems.length,
                        (index) {
                          final item = controller.chiTietItems[index];
                          return DataRow(
                            cells: [
                              DataCell(Text((index + 1).toString())),
                              DataCell(Text(item.tenSanPham ?? '')),
                              DataCell(Text(item.maSo ?? '')),
                              DataCell(Text(item.donVi ?? '')),
                              DataCell(Text('${item.soLuongChungTu}')),
                              DataCell(Text('${item.soLuongThucNhap}')),
                              DataCell(Text('${item.donGia}')),
                              DataCell(Text('${item.thanhTien}')),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          size: 20, color: Colors.blue),
                                      onPressed: () =>
                                          controller.editChiTietItem(index),
                                      tooltip: 'Chỉnh sửa',
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          size: 20, color: Colors.red),
                                      onPressed: () =>
                                          controller.removeChiTietItem(index),
                                      tooltip: 'Xóa',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
