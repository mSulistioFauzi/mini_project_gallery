import 'package:get/get.dart';
import 'package:mini_project/core.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: AppRoute.LIST_PICTURES,
      page: () => ListPictureView(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: AppRoute.DETAIL_PICTURES,
      page: () => DetailPictureView(),
      binding: PictureBinding(),
    )
  ];
}

