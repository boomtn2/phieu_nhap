import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main/app/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: AppPages.features,
    );
  }
}

//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() async {
//     final repo = RepositoryPhieuNhapImpl(remote: FireStoreRemote());
//     repo.createPhieuNhap(PhieuNhapKhoEntity(
//         soPhieu: 'PNK002',
//         ngayLap: DateTime.now(),
//         nguoiLapPhieu: 'Nguyen Van A',
//         chiTiet: [
//           ChiTietNhapKhoEntity(
//             maSo: 'MH001',
//             tenSanPham: 'Mat Hang 1',
//             donGia: 10000,
//             donVi: '',
//             soLuongChungTu: 0,
//             soLuongThucNhap: 0,
//             thanhTien: 0,
//           ),
//           ChiTietNhapKhoEntity(
//             maSo: 'MH002',
//             tenSanPham: 'Mat Hang 2',
//             donVi: '',
//             soLuongChungTu: 0,
//             soLuongThucNhap: 0,
//             thanhTien: 0,
//             donGia: 20000,
//           ),
//         ],
//         donVi: 'a',
//         boPhan: 'a',
//         no: '',
//         co: '',
//         hoTenNguoiGiao: '',
//         lyDoNhap: '',
//         diaDiemNhap: '',
//         soChungTuGoc: 0,
//         tongSoTien: 0,
//         nguoiGiaoHang: '',
//         thuKho: '',
//         keToanTruong: ''));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
