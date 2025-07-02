import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phieu_nhap/feature/tao_phieu_nhap_kho/tao_phieu_nhap_kho_controller.dart';

class ConfirmationView extends GetView<TaoPhieuNhapKhoController> {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác Nhận Phiếu Nhập Kho'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'THÔNG TIN PHIẾU NHẬP KHO',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const Divider(height: 20, thickness: 1),
            _buildInfoRow('Số Phiếu:', controller.soPhieuController.text),
            _buildInfoRow('Ngày Lập:', controller.ngayLapController.text),
            _buildInfoRow('Đơn Vị:', controller.donViController.text),
            _buildInfoRow('Bộ Phận:', controller.boPhanController.text),
            _buildInfoRow('Nợ/Có:',
                '${controller.noController.text}/${controller.coController.text}'),
            _buildInfoRow(
                'Họ Tên Người Giao:', controller.hoTenNguoiGiaoController.text),
            _buildInfoRow('Lý Do Nhập:', controller.lyDoNhapController.text),
            _buildInfoRow(
                'Địa Điểm Nhập:', controller.diaDiemNhapController.text),
            _buildInfoRow(
                'Số Chứng Từ Gốc:', controller.soChungTuGocController.text),
            const SizedBox(height: 30),
            const Text(
              'CHI TIẾT HÀNG NHẬP',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const Divider(height: 20, thickness: 1),
            Obx(
              () => controller.chiTietItems.isEmpty
                  ? const Center(
                      child: Text('Không có chi tiết hàng nhập nào.',
                          style: TextStyle(fontStyle: FontStyle.italic)))
                  : SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade400, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          headingRowColor:
                              WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) =>
                                      Colors.blueGrey[50]),
                          columnSpacing: 16.0,
                          horizontalMargin: 12,
                          dataRowMinHeight: 40,
                          dataRowMaxHeight: 60,
                          columns: const [
                            DataColumn(
                                label: Text('STT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Tên SP',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Mã Số',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Đơn Vị',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('SL CT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('SL Thực',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Đơn Giá',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Thành Tiền',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: List<DataRow>.generate(
                            controller.chiTietItems.length,
                            (index) {
                              final item = controller.chiTietItems[index];
                              return DataRow(
                                cells: [
                                  DataCell(Text((index + 1).toString())),
                                  DataCell(Text(item.tenSanPham ?? '')),
                                  DataCell(Text('${item.maSo}')),
                                  DataCell(Text('${item.donVi}')),
                                  DataCell(Text('${item.soLuongChungTu}')),
                                  DataCell(Text('${item.soLuongThucNhap}')),
                                  DataCell(Text('${item.donGia}')),
                                  DataCell(Text('${item.thanhTien}')),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 30),
            const Text(
              'TỔNG KẾT VÀ CHỮ KÝ',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const Divider(height: 20, thickness: 1),
            _buildInfoRow(
                'Tổng Số Tiền:', '${controller.tongSoTienController.text} VNĐ'),
            _buildInfoRow(
                'Người Lập Phiếu:', controller.nguoiLapPhieuController.text),
            _buildInfoRow(
                'Người Giao Hàng:', controller.nguoiGiaoHangController.text),
            _buildInfoRow('Thủ Kho:', controller.thuKhoController.text),
            _buildInfoRow(
                'Kế Toán Trưởng:', controller.keToanTruongController.text),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Gọi hàm submit từ controller
                    controller.confirmSubmit();
                    Get.back();
                    // Có thể thêm Get.back() để quay lại sau khi submit nếu muốn
                  },
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Xác Nhận & Lưu',
                      style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150, // Điều chỉnh độ rộng cho tiêu đề
            child: Text(
              '$title ',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '[Chưa nhập]' : value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
