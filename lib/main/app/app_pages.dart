import 'package:get/get.dart';
import 'package:phieu_nhap/feature/tao_phieu_nhap_kho/tao_phieu_nhap_kho.dart';
import 'package:phieu_nhap/feature/tao_phieu_nhap_kho/tao_phieu_nhap_kho_binding.dart';

class AppPages {
  static final List<GetPage<dynamic>> features = <GetPage<dynamic>>[
    GetPage(
      name: '/',
      page: () => const TaoPhieuNhapKhoPage(),
      binding: TaoPhieuNhapKhoBinding(),
    ),
  ];
}
