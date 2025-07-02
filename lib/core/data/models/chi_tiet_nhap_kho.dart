import '../../domain/entity/chi_tiet_nhap_kho.dart';

class ChiTietNhapKhoModel extends ChiTietNhapKhoEntity {
  ChiTietNhapKhoModel({
    required super.tenSanPham,
    required super.maSo,
    required super.donVi,
    required super.soLuongChungTu,
    required super.soLuongThucNhap,
    required super.donGia,
    required super.thanhTien,
  });

  factory ChiTietNhapKhoModel.fromJson(Map<String, dynamic> json) {
    return ChiTietNhapKhoModel(
      tenSanPham: json['ten_san_pham'] ?? '',
      maSo: json['ma_so'] ?? '',
      donVi: json['don_vi'] ?? '',
      soLuongChungTu: json['so_luong_chung_tu'] ?? 0,
      soLuongThucNhap: json['so_luong_thuc_nhap'] ?? 0,
      donGia: json['don_gia'] ?? 0,
      thanhTien: json['thanh_tien'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'ten_san_pham': tenSanPham,
        'ma_so': maSo,
        'don_vi': donVi,
        'so_luong_chung_tu': soLuongChungTu,
        'so_luong_thuc_nhap': soLuongThucNhap,
        'don_gia': donGia,
        'thanh_tien': thanhTien,
      };

  static Map<String, dynamic> toJsonEntity(ChiTietNhapKhoEntity chiTiet) => {
        'ten_san_pham': chiTiet.tenSanPham,
        'ma_so': chiTiet.maSo,
        'don_vi': chiTiet.donVi,
        'so_luong_chung_tu': chiTiet.soLuongChungTu,
        'so_luong_thuc_nhap': chiTiet.soLuongThucNhap,
        'don_gia': chiTiet.donGia,
        'thanh_tien': chiTiet.thanhTien,
      };
}
