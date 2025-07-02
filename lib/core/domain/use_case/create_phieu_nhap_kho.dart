import 'package:dartz/dartz.dart';
import 'package:phieu_nhap/core/domain/entity/phieu_nhap_kho.dart';
import 'package:phieu_nhap/core/domain/repository/repository_phieunhap.dart';
import 'package:phieu_nhap/core/domain/use_case/use_case.dart';

class CreatePhieuNhapKho
    extends UseCase<PhieuNhapKhoEntity, Either<Left, bool>> {
  final RepositoryPhieuNhap repositoryPhieuNhap;

  CreatePhieuNhapKho({required this.repositoryPhieuNhap});

  @override
  Future<Either<Left, bool>> call(PhieuNhapKhoEntity phieuNhapKho) async {
    return repositoryPhieuNhap.createPhieuNhap(phieuNhapKho);
  }
}
