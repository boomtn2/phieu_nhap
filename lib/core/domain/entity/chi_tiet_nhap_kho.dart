import 'package:phieu_nhap/core/domain/entity/entity.dart';

class ChiTietNhapKhoEntity extends Entity {
  final String? tenSanPham;
  final String? maSo;
  final String? donVi;
  final int? soLuongChungTu;
  final int? soLuongThucNhap;
  final double? donGia;
  final double? thanhTien;

  ChiTietNhapKhoEntity({
    this.tenSanPham,
    this.maSo,
    this.donVi,
    this.soLuongChungTu,
    this.soLuongThucNhap,
    this.donGia,
    this.thanhTien,
  });

  ChiTietNhapKhoEntity copyWith({
    String? tenSanPham,
    String? maSo,
    String? donVi,
    int? soLuongChungTu,
    int? soLuongThucNhap,
    double? donGia,
    double? thanhTien,
  }) {
    return ChiTietNhapKhoEntity(
      tenSanPham: tenSanPham ?? this.tenSanPham,
      maSo: maSo ?? this.maSo,
      donVi: donVi ?? this.donVi,
      soLuongChungTu: soLuongChungTu ?? this.soLuongChungTu,
      soLuongThucNhap: soLuongThucNhap ?? this.soLuongThucNhap,
      donGia: donGia ?? this.donGia,
      thanhTien: thanhTien ?? this.thanhTien,
    );
  }
}
