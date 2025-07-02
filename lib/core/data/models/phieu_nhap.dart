import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/phieu_nhap_kho.dart';
import 'chi_tiet_nhap_kho.dart';

class PhieuNhapKhoModel extends PhieuNhapKhoEntity {
  PhieuNhapKhoModel({
    required super.soPhieu,
    required super.ngayLap,
    required super.donVi,
    required super.boPhan,
    required super.no,
    required super.co,
    required super.hoTenNguoiGiao,
    required super.lyDoNhap,
    required super.diaDiemNhap,
    required super.soChungTuGoc,
    required super.tongSoTien,
    required super.nguoiLapPhieu,
    required super.nguoiGiaoHang,
    required super.thuKho,
    required super.keToanTruong,
    required super.chiTiet,
  });

  factory PhieuNhapKhoModel.fromJson(
      Map<String, dynamic> json, List<ChiTietNhapKhoModel> chiTiet) {
    return PhieuNhapKhoModel(
      soPhieu: json['so_phieu'] ?? '',
      ngayLap: (json['ngay_lap'] as Timestamp).toDate(),
      donVi: json['don_vi'] ?? '',
      boPhan: json['bo_phan'] ?? '',
      no: json['no'] ?? '',
      co: json['co'] ?? '',
      hoTenNguoiGiao: json['ho_ten_nguoi_giao'] ?? '',
      lyDoNhap: json['ly_do_nhap'] ?? '',
      diaDiemNhap: json['dia_diem_nhap'] ?? '',
      soChungTuGoc: json['so_chung_tu_goc'] ?? 0,
      tongSoTien: json['tong_so_tien'] ?? 0,
      nguoiLapPhieu: json['nguoi_lap_phieu'] ?? '',
      nguoiGiaoHang: json['nguoi_giao_hang'] ?? '',
      thuKho: json['thu_kho'] ?? '',
      keToanTruong: json['ke_toan_truong'] ?? '',
      chiTiet: chiTiet,
    );
  }

  Map<String, dynamic> toJson() => {
        'so_phieu': soPhieu,
        'ngay_lap': Timestamp.fromDate(ngayLap),
        'don_vi': donVi,
        'bo_phan': boPhan,
        'no': no,
        'co': co,
        'ho_ten_nguoi_giao': hoTenNguoiGiao,
        'ly_do_nhap': lyDoNhap,
        'dia_diem_nhap': diaDiemNhap,
        'so_chung_tu_goc': soChungTuGoc,
        'tong_so_tien': tongSoTien,
        'nguoi_lap_phieu': nguoiLapPhieu,
        'nguoi_giao_hang': nguoiGiaoHang,
        'thu_kho': thuKho,
        'ke_toan_truong': keToanTruong,
      };

  static Map<String, dynamic> toJsonEntity(PhieuNhapKhoEntity phieuNhap) => {
        'so_phieu': phieuNhap.soPhieu,
        'ngay_lap': Timestamp.fromDate(phieuNhap.ngayLap),
        'don_vi': phieuNhap.donVi,
        'bo_phan': phieuNhap.boPhan,
        'no': phieuNhap.no,
        'co': phieuNhap.co,
        'ho_ten_nguoi_giao': phieuNhap.hoTenNguoiGiao,
        'ly_do_nhap': phieuNhap.lyDoNhap,
        'dia_diem_nhap': phieuNhap.diaDiemNhap,
        'so_chung_tu_goc': phieuNhap.soChungTuGoc,
        'tong_so_tien': phieuNhap.tongSoTien,
        'nguoi_lap_phieu': phieuNhap.nguoiLapPhieu,
        'nguoi_giao_hang': phieuNhap.nguoiGiaoHang,
        'thu_kho': phieuNhap.thuKho,
        'ke_toan_truong': phieuNhap.keToanTruong,
      };
}
