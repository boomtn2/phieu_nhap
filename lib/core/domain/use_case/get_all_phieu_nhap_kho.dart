import 'package:dartz/dartz.dart';
import 'package:phieu_nhap/core/domain/entity/phieu_nhap_kho.dart';
import 'package:phieu_nhap/core/domain/repository/repository_phieunhap.dart';
import 'package:phieu_nhap/core/domain/use_case/use_case.dart';

class GetAllPhieuNhapKho
    extends NoParamsUseCase<Either<Left, List<PhieuNhapKhoEntity>>> {
  final RepositoryPhieuNhap repositoryPhieuNhap;

  GetAllPhieuNhapKho({required this.repositoryPhieuNhap});

  @override
  Future<Either<Left, List<PhieuNhapKhoEntity>>> call() async {
    return repositoryPhieuNhap.getAllPhieuNhap();
  }
}
