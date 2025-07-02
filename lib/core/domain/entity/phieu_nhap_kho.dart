import 'package:phieu_nhap/core/domain/entity/entity.dart';

import 'chi_tiet_nhap_kho.dart';

class PhieuNhapKhoEntity extends Entity {
  final String soPhieu;
  final DateTime ngayLap;
  final String donVi;
  final String boPhan;
  final String no;
  final String co;
  final String hoTenNguoiGiao;
  final String lyDoNhap;
  final String diaDiemNhap;
  final int soChungTuGoc;
  final double tongSoTien;
  final String nguoiLapPhieu;
  final String nguoiGiaoHang;
  final String thuKho;
  final String keToanTruong;
  final List<ChiTietNhapKhoEntity> chiTiet;

  PhieuNhapKhoEntity({
    required this.soPhieu,
    required this.ngayLap,
    required this.donVi,
    required this.boPhan,
    required this.no,
    required this.co,
    required this.hoTenNguoiGiao,
    required this.lyDoNhap,
    required this.diaDiemNhap,
    required this.soChungTuGoc,
    required this.tongSoTien,
    required this.nguoiLapPhieu,
    required this.nguoiGiaoHang,
    required this.thuKho,
    required this.keToanTruong,
    required this.chiTiet,
  });
}
