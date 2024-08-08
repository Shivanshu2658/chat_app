import 'package:get/get.dart';

class SignUpController extends GetxController {
  var firstname = ''.obs;
  var lastname = ''.obs;
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var emailError = ''.obs;

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

  void signUp() {
    // Add signup logic here
    if (emailError.value.isEmpty) {

      print('FirstName: ${firstname.value}');
    print('Lastname: ${lastname.value}');
    print('Username: ${username.value}');
    print('Email: ${email.value}');
    print('Password: ${password.value}');
    } else {
      print('Email validation failed');
    }
  }
}
