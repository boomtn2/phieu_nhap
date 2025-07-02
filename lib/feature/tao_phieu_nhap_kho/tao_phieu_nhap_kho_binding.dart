import 'package:get/get.dart';
import 'package:phieu_nhap/core/data/firestore/firestore_remote.dart';
import 'package:phieu_nhap/core/data/repository_impls/repository_impl.dart';

import '../../../core/presentation/bindings.dart';
import '../../core/domain/use_case/create_phieu_nhap_kho.dart';
import 'tao_phieu_nhap_kho_controller.dart';

class TaoPhieuNhapKhoBinding extends CoreBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => TaoPhieuNhapKhoController(),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut(() => FireStoreRemote());
    Get.lazyPut(() => RepositoryPhieuNhapImpl(remote: Get.find()));
  }

  @override
  void bindingsUseCase() {
    Get.put(CreatePhieuNhapKho(
        repositoryPhieuNhap: Get.find<RepositoryPhieuNhapImpl>()));
  }
}
