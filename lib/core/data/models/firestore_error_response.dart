import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phieu_nhap/core/data/models/response.dart';

import 'firestore_code_error.dart';

class FireStoreErrorResponse extends Response {
  final String message;
  final String code;

  FireStoreErrorResponse({
    required this.message,
    required this.code,
  });

  factory FireStoreErrorResponse.fromFirebaseException(FirebaseException e) {
    return FireStoreErrorResponse(
      code: e.code,
      message: CodeError.getFirebaseErrorMessage(e.code),
    );
  }

  @override
  String toString() => '[$code] $message';
}
