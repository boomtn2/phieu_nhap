import 'package:get/get.dart';

import 'mixin/app_loader_mixin.dart';

class Controller extends GetxController with AppLoaderMixin {
  final errorMessagePresent = RxnString();
  final isError = false.obs;

  void consumeState<T>(
    Future<T> function, {
    Function(T)? onSuccess,
  }) {
    Get.showOverlay<T>(
      asyncFunction: () => function,
      loadingWidget: loadingWidget,
      // opacityColor: AppColor.transparent,
    ).then((value) {
      errorMessagePresent.value = null;
      isError.value = false;
      onSuccess?.call(value);
    }).onError((error, stackTrace) {
      isError.value = true;
      remoteErrorHandle(error);
    });
  }

  void remoteErrorHandle(Object? error) {
    // if (_handleLossConnectionError(error)) {
    //   return;
    // }
    // if (error is DioError) {
    //   errorMessagePresent.value = _handleApiError(error);
    // }
    return;
  }
}
