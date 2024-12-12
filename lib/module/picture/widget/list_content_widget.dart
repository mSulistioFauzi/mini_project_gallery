import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/core.dart';

class ListContentWidget extends StatelessWidget {
  final Map<String, dynamic> picture;

  const ListContentWidget({Key? key, required this.picture}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final String imageUrl = picture['image_url'] ?? 'https://via.placeholder.com/200';
    final String author = picture['author'] ?? 'Unknown Author';
    final String id = picture['id'] ?? 'No ID';

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Menyiapkan controller DetailController dan mengirim data
          final DetailPictureController detailPictureController = Get.put(DetailPictureController());

          // Mengirim data ke controller sebelum navigasi
          detailPictureController.id = id;
          detailPictureController.pictureDetail.value = picture;


          // Menampilkan id di console untuk debugging
          print("ID: $id");

          // Navigasi ke halaman DetailPage setelah data disiapkan di controller
          Get.toNamed(AppRoute.DETAIL_PICTURES, arguments: {
          'id': id,
          'picture': picture,
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'by $author',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
