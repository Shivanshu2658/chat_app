import 'package:chat_app/auth/login/login_screen.dart';
import 'package:chat_app/auth/register/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var firstname = ''.obs;
  var lastname = ''.obs;
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var emailError = ''.obs;
  var showLoginPassword = false.obs;

  void setFirstname(String value) {
    firstname.value = value;
  }

  void setLastname(String value) {
    lastname.value = value;
  }

  void setUsername(String value) {
    username.value = value;
  }

  void setEmail(String value) {
    email.value = value;
    validateEmail(value);
  }

  void setPassword(String value) {
    password.value = value;
  }

  void validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailError.value = 'Invalid email address';
    } else {
      emailError.value = '';
    }
  }

  Future<void> signUp() async {
    if (emailError.value.isEmpty) {
      final requestBody = {
        "firstName": firstname.value,
        "lastName": lastname.value,
        "email": email.value,
        "password": password.value,
        "userName": username.value,
      };

      try {
        print("dhoisdfghfd");
        final value = await registerRepo.registerApiCall(requestBody);
        print("sddbfibsioudfiuasdfuisad");
        if (value!.success!) {
          Get.snackbar(
            'Success',
            'Registration successful!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          Get.off(() => LoginScreen());
        } else {
          Get.snackbar(
            'Error',
            'Registration failed: ${value.msg}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } catch (error) {
        Get.snackbar(
          'Error',
          'An error occurred: $error',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Email validation failed',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
