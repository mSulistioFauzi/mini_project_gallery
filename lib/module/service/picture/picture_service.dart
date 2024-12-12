import 'package:dio/dio.dart';

class PictureService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://picsum.photos",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  /// Fetch list of pictures with pagination
  Future<List<dynamic>> fetchPictures() async {
    try {
      final response = await _dio.get("/v2/list");

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to fetch pictures");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception("Error: ${e.response?.statusMessage}");
      } else {
        throw Exception("Connection Error: ${e.message}");
      }
    }
  }
}