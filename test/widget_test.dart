import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:phieu_nhap/core/data/firestore/firestore_remote.dart';
import 'package:phieu_nhap/core/data/models/firestore_error_response.dart';
import 'package:phieu_nhap/core/data/models/success_response.dart';
import 'package:phieu_nhap/core/data/repository_impls/repository_impl.dart';
import 'package:phieu_nhap/core/domain/entity/chi_tiet_nhap_kho.dart';
import 'package:phieu_nhap/core/domain/entity/phieu_nhap_kho.dart';
import 'package:phieu_nhap/core/domain/use_case/create_phieu_nhap_kho.dart';

import 'mock/mock.mocks.dart';

class FireStoreRemoteTestHelper extends FireStoreRemote {
  FireStoreRemoteTestHelper(FirebaseFirestore firestore) : super(firestore);
}

void main() {
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference mockCollection;
  late MockQuerySnapshot mockQuerySnapshot;
  late MockQueryDocumentSnapshot mockDocument;
  late MockDocumentReference mockDocRef;
  late FireStoreRemote fireStoreRemote;

  late RepositoryPhieuNhapImpl repo;
  late CreatePhieuNhapKho createPhieuNhapKho;
  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollection = MockCollectionReference();
    mockQuerySnapshot = MockQuerySnapshot();
    mockDocument = MockQueryDocumentSnapshot();
    mockDocRef = MockDocumentReference();

    fireStoreRemote = FireStoreRemoteTestHelper(mockFirestore);

    repo = RepositoryPhieuNhapImpl(remote: fireStoreRemote);
    createPhieuNhapKho = CreatePhieuNhapKho(repositoryPhieuNhap: repo);

    when(mockFirestore.doc(any)).thenReturn(mockDocRef);
    when(mockDocRef.set(any)).thenAnswer((_) async => Future.value());
  });

  group('fetchCollection', () {
    test('should return SuccessResponse when fetch succeeds', () async {
      // Arrange
      when(mockFirestore.collection(any)).thenReturn(mockCollection);
      when(mockCollection.get()).thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([mockDocument]);
      when(mockDocument.data()).thenReturn({'key': 'value'});

      // Act
      final result = await fireStoreRemote.fetchCollection('test');

      // Assert
      if (result is SuccessResponse) {
        expect(result.statusCode, 200);
        expect(result.data, isList);
        expect(result.message, contains('Lấy dữ liệu thành công'));
      } else if (result is FireStoreErrorResponse) {
        fail('Expected SuccessResponse, but got FireStoreErrorResponse');
      }
    });

    test('should return FireStoreErrorResponse on FirebaseException', () async {
      when(mockFirestore.collection(any)).thenThrow(FirebaseException(
        plugin: 'firebase_firestore',
        code: 'not-found',
        message: 'Collection not found',
      ));

      final result = await fireStoreRemote.fetchCollection('invalid');

      expect(result, isA<FireStoreErrorResponse>());
      final error = result as FireStoreErrorResponse;
      expect(error.code, 'not-found');
      expect(error.message, 'Không tìm thấy dữ liệu.');
    });

    test('Usecase', () async {
      final phieu = PhieuNhapKhoEntity(
        soPhieu: 'PNK0025',
        ngayLap: DateTime.now(),
        donVi: 'Công ty ABC',
        boPhan: 'Kho A',
        no: '111',
        co: '152',
        hoTenNguoiGiao: 'Nguyễn Văn A',
        lyDoNhap: 'Nhập hàng hóa',
        diaDiemNhap: 'Kho',
        soChungTuGoc: 1,
        tongSoTien: 1000000,
        nguoiLapPhieu: 'Nguyễn B',
        nguoiGiaoHang: 'Nguyễn Văn A',
        thuKho: 'Lê Thị C',
        keToanTruong: 'Phạm Văn D',
        chiTiet: [],
      );

      final result1 = await createPhieuNhapKho.call(phieu);
      expect(result1, Right(true));

      final phieu2 = PhieuNhapKhoEntity(
        soPhieu: 'PNK0025',
        ngayLap: DateTime.now(),
        donVi: 'Công ty ABC',
        boPhan: 'Kho A',
        no: '111',
        co: '152',
        hoTenNguoiGiao: 'Nguyễn Văn A',
        lyDoNhap: 'Nhập hàng hóa',
        diaDiemNhap: 'Kho',
        soChungTuGoc: 1,
        tongSoTien: 1000000,
        nguoiLapPhieu: 'Nguyễn B',
        nguoiGiaoHang: 'Nguyễn Văn A',
        thuKho: 'Lê Thị C',
        keToanTruong: 'Phạm Văn D',
        chiTiet: [
          ChiTietNhapKhoEntity(
            maSo: 'HH001',
            tenSanPham: 'Hàng hóa 1',
            soLuongChungTu: 10,
            donGia: 100000,
            thanhTien: 1000000,
          ),
          ChiTietNhapKhoEntity(
            maSo: 'HH002',
            tenSanPham: 'Hàng hóa 1',
            soLuongChungTu: 10,
            donGia: 100000,
            thanhTien: 1000000,
          ),
          ChiTietNhapKhoEntity(
            maSo: 'HH003',
            tenSanPham: 'Hàng hóa 1',
            soLuongChungTu: 10,
            donGia: 100000,
            thanhTien: 1000000,
          ),
        ],
      );

      final result2 = await createPhieuNhapKho.call(phieu2);
      expect(result2, Right(true));
    });
  });
}
