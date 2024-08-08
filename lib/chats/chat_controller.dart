import 'package:chat_app/add_users/add_users_repo.dart';
import 'package:chat_app/add_users/add_users_response.dart';
import 'package:chat_app/chats/chat_repo.dart';
import 'package:chat_app/chats/chat_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {

  ChatResponse? response;

  RxList<Chats> chatList = <Chats>[].obs;


  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await addUserMethod();
    });
  }

  Future<void> addUserMethod() async {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    var body = { "receiverId" : "66b39134bb3d7b866e39a7b2"};

    try {
      final value = await chatRepo.chatApiCall(body);


      if (value?.success  == true) {
        response = value;
        chatList.value = response?.chats! ?? [];
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
