import 'package:flutter/material.dart';
import 'package:mini_project/core.dart';
import 'package:get/get.dart';

class DetailContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller
    final DetailPictureController controller =  Get.put(DetailPictureController());

    // Menggunakan Obx untuk merender UI secara reaktif
    return Obx(() {
      // Cek apakah data picture kosong atau tidak
      if (controller.pictureDetail.isEmpty) {
        return Center(
          child: Text("No Picture Data Available"),
        );
      }

      // Jika data picture ada
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Image.network(
              controller.pictureDetail['image_url'] ?? 'https://via.placeholder.com/300',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 300,
                color: Colors.grey,
                child: const Icon(Icons.error, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            // Informasi
            Text(
              "By: ${controller.pictureDetail['author'] ?? 'Unknown Author'}",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    });
  }
}