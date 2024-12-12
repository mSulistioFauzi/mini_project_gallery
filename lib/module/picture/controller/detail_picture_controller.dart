import 'package:get/get.dart';

class DetailPictureController extends GetxController {
  // Reactive loading state
  var isLoading = true.obs;

  // ID gambar yang diambil dari arguments
  late String id;

  // Data detail gambar yang reactive
  late RxMap<String, dynamic> pictureDetail = RxMap<String, dynamic>();

  @override
  void onInit() {
    super.onInit();

    // Ambil arguments dari Get
    final arguments = Get.arguments;

    if (arguments != null && arguments is Map<String, dynamic>) {
      // Pastikan arguments memiliki id dan picture
      id = arguments['id'] ?? 'No ID';
      pictureDetail.value = arguments['picture'] ?? {};
    } else {
      // Jika arguments tidak valid
      id = 'No ID';
      pictureDetail.value = {};
      setLoading(false);
    }
  }

  // Set loading state
  void setLoading(bool value) {
    isLoading.value = value;
  }
}