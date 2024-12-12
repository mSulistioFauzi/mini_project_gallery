import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/core.dart';

class DetailPictureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DetailPictureController controller = Get.find<DetailPictureController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Photo'),
      ),
      body: DetailContentWidget(),
    );
  }
}
