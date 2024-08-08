import 'package:chat_app/auth/login/login_repo.dart';
import 'package:chat_app/auth/login/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/home_screen.dart';

class LoginController extends GetxController {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  RxString loginEmail = "".obs;
  RxString loginPassword = "".obs;
  RxBool showLoginPassword = false.obs;
  RxBool isLoading = false.obs;

  LoginResponse? loginResponseData;

  Future<LoginResponse?> loginMethod() async {
    isLoading.value = true;
    var body = {"email": loginEmail.value, "password": loginPassword.value};

    try {
      final response = await loginRepo.loginApiCall(body);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (response!.success!) {
        await prefs.setBool("isLoggedIn", true);
        await prefs.setString("token", response.token!);
        isLoading.value = false;
        Get.snackbar(
          'Success',
          'Registration successful!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.off(() => HomeScreen());
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Registration failed: ${response.msg}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      return response;
    }catch (error) {
      isLoading.value = false;

      Get.snackbar(
        'Error',
        'An error occurred: $error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
