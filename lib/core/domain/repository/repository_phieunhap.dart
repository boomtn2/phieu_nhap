import 'package:dartz/dartz.dart';
import 'package:phieu_nhap/core/domain/entity/phieu_nhap_kho.dart';

abstract class RepositoryPhieuNhap {
  Future<Either<Left, List<PhieuNhapKhoEntity>>> getAllPhieuNhap();

  Future<Either<Left, bool>> createPhieuNhap(PhieuNhapKhoEntity phieuNhap);

  Future<Either<Left, bool>> updatePhieuNhap(PhieuNhapKhoEntity phieuNhap);

  Future<Either<Left, bool>> deletePhieuNhap(String soPhieu);
}
