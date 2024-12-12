import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/core.dart';

class ListPictureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListPictureController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('List Photo'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.pictures.length,
            itemBuilder: (context, index) {
              var picture = controller.pictures[index];
              return ListContentWidget(
                picture: picture,
              );
            },
          );
        }
      }),
    );
  }
}
