import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.LIST_PICTURES, // Menggunakan AppRoute untuk rute awal
      getPages: AppPages.routes, // Menggunakan daftar halaman dari AppPages
    );
  }
}