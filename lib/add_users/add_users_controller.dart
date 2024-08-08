import 'package:chat_app/add_users/add_users_repo.dart';
import 'package:chat_app/add_users/add_users_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserController extends GetxController {

  AddUserResponse? response;

  RxList<Users> userList = <Users>[].obs;


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

    try {
      final value = await addUserRepo.addUserApiCall();


      if (value?.success  == true) {
        response = value;
        userList.value = response?.users! ?? [];
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
