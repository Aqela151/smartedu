import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }
}
