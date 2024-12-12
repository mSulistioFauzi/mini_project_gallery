import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final RxBool isLoading;
  final Widget child;

  LoadingWidget({
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return child;
      }
    });
  }
}