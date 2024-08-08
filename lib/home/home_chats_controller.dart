
import 'package:chat_app/home/home_chats_repo.dart';
import 'package:chat_app/home/home_chats_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeChatController extends GetxController {

  HomeChatResponse? response;

  RxList<String> userList = <String>[].obs;


  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await homeChatMethod();
    });
  }

  Future<void> homeChatMethod() async {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final value = await homeChatRepo.homeChatApiCall();


      if (value?.success  == true) {
        response = value;
        userList.value = response?.connectedUsers! ?? [];
      } else {
        Get.snackbar(
          'Error',
          'Failed to add user: ${value?.msg}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      Get.back(); // Remove the loader
      Get.snackbar(
        'Error',
        'An error occurred: $error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }finally{
      Get.back(); // Remove the loader

    }
  }
}
