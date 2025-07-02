import 'package:dartz/dartz.dart';
import 'package:phieu_nhap/core/data/firestore/firestore_remote.dart';
import 'package:phieu_nhap/core/data/models/success_response.dart';
import 'package:phieu_nhap/core/domain/entity/phieu_nhap_kho.dart';
import 'package:phieu_nhap/core/domain/repository/repository_phieunhap.dart';

import '../models/chi_tiet_nhap_kho.dart';
import '../models/phieu_nhap.dart';

class RepositoryPhieuNhapImpl implements RepositoryPhieuNhap {
  final FireStoreRemote remote;

  RepositoryPhieuNhapImpl({required this.remote});

  @override
  Future<Either<Left, bool>> createPhieuNhap(
      PhieuNhapKhoEntity phieuNhap) async {
    try {
      Map<String, dynamic> model = PhieuNhapKhoModel.toJsonEntity(phieuNhap);
      List<Map<String, dynamic>> subDataList = phieuNhap.chiTiet
          .map((e) => ChiTietNhapKhoModel.toJsonEntity(e))
          .toList();

      final response = await remote.addDocumentWithSubCollection(
          path: 'phieu_nhap_kho/${phieuNhap.soPhieu}',
          data: model,
          subCollection: 'chi_tiet',
          subDataList: subDataList);
      if (response is SuccessResponse) {
        return Right(true);
      } else {
        return Left(Left(response));
      }
    } catch (e) {
      return Left(Left(e));
    }
  }

  @override
  Future<Either<Left, bool>> deletePhieuNhap(String soPhieu) async {
    try {
      remote.deleteDocument('');
      return Right(true);
    } catch (e) {
      return Left(Left(e));
    }
  }

  @override
  Future<Either<Left, List<PhieuNhapKhoEntity>>> getAllPhieuNhap() async {
    try {
      remote.deleteDocument('');
      return Right([]);
    } catch (e) {
      return Left(Left(e));
    }
  }

  @override
  Future<Either<Left, bool>> updatePhieuNhap(
      PhieuNhapKhoEntity phieuNhap) async {
    try {
      return Right(true);
    } catch (e) {
      return Left(Left(e));
    }
  }
}
