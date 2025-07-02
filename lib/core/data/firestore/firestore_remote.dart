import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/firestore_error_response.dart';
import '../models/response.dart';
import '../models/success_response.dart';

class FireStoreRemote {
  final FirebaseFirestore _db;

  FireStoreRemote([FirebaseFirestore? firestore])
      : _db = firestore ?? FirebaseFirestore.instance;

  Future<Response> fetchCollection(String path) async {
    try {
      final snapshot = await _db.collection(path).get();
      List<Map<String, dynamic>> datas =
          snapshot.docs.map((e) => e.data()).toList();
      return SuccessResponse(
        statusCode: 200,
        data: datas,
        message: 'Lấy dữ liệu thành công',
      );
    } on FirebaseException catch (e) {
      return FireStoreErrorResponse.fromFirebaseException(e);
    } catch (e) {
      return FireStoreErrorResponse(
        code: 'unknown',
        message: 'Đã xảy ra lỗi không xác định: $e',
      );
    }
  }

  Future<Response> addDocument(String path, Map<String, dynamic> data) async {
    try {
      final response = await _db.collection(path).add(data);

      return SuccessResponse(
        statusCode: 200,
        data: response,
        message: 'Thêm dữ liệu thành công',
      );
    } on FirebaseException catch (e) {
      return FireStoreErrorResponse.fromFirebaseException(e);
    } catch (e) {
      return FireStoreErrorResponse(
        code: 'unknown',
        message: 'Đã xảy ra lỗi không xác định: $e',
      );
    }
  }

  Future<Response> updateDocument(
      String path, Map<String, dynamic> data) async {
    try {
      await _db.doc(path).update(data);

      return SuccessResponse(
        statusCode: 200,
        data: null,
        message: 'Cập nhật dữ liệu thành công',
      );
    } on FirebaseException catch (e) {
      return FireStoreErrorResponse.fromFirebaseException(e);
    } catch (e) {
      return FireStoreErrorResponse(
        code: 'unknown',
        message: 'Đã xảy ra lỗi không xác định: $e',
      );
    }
  }

  Future<Response> deleteDocument(String path) async {
    try {
      await _db.doc(path).delete();

      return SuccessResponse(
        statusCode: 200,
        data: null,
        message: 'Xoá dữ liệu thành công',
      );
    } on FirebaseException catch (e) {
      return FireStoreErrorResponse.fromFirebaseException(e);
    } catch (e) {
      return FireStoreErrorResponse(
        code: 'unknown',
        message: 'Đã xảy ra lỗi không xác định: $e',
      );
    }
  }

  Future<Response> addDocumentWithSubCollection({
    required String path, // ví dụ: 'phieu_nhap_kho/PNK001'
    required Map<String, dynamic> data, // dữ liệu document chính
    required String subCollection, // ví dụ: 'chi_tiet'
    required List<Map<String, dynamic>> subDataList, // danh sách chi tiết
  }) async {
    try {
      final docRef = _db.doc(path);
      await docRef.set(data);

      // Thêm từng document con trong subcollection
      for (final item in subDataList) {
        await docRef.collection(subCollection).add(item);
      }

      return SuccessResponse(
        statusCode: 200,
        data: null,
        message: 'Thêm phiếu và chi tiết thành công',
      );
    } on FirebaseException catch (e) {
      return FireStoreErrorResponse.fromFirebaseException(e);
    } catch (e) {
      return FireStoreErrorResponse(
        code: 'unknown',
        message: 'Đã xảy ra lỗi không xác định: $e',
      );
    }
  }
}
