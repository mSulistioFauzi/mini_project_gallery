import 'package:get/get.dart';
import 'package:mini_project/core.dart';

class ListPictureController extends GetxController {
  var pictures = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  final PictureService apiService = PictureService();

  @override
  void onInit() {
    super.onInit();
    fetchPictures();
  }

  void fetchPictures() async {
    try {
      isLoading(true);
      var data = await apiService.fetchPictures();

      // Sanitasi data
      var sanitizedData = data.map((picture) {
        return {
          'author': picture['author'] ?? 'Unknown Author',
          'image_url': picture['download_url'] ?? 'https://via.placeholder.com/200',
          'id': picture['id'] ?? 'no id',
        };
      }).toList();

      pictures.assignAll(sanitizedData);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}