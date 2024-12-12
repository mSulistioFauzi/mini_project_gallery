import 'package:get/get.dart';
import 'package:mini_project/core.dart';

class PictureBinding extends Bindings {
  @override
  void dependencies() {
    // Mendaftarkan controller untuk List Picture
    Get.lazyPut<ListPictureController>(() => ListPictureController());

    // Mendaftarkan controller untuk Detail Picture
    Get.lazyPut<DetailPictureController>(() => DetailPictureController());
  }
}
