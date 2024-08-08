// signup_page.dart
import 'package:chat_app/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
        
                TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: controller.setFirstname,
                ),SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: controller.setLastname,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: controller.setUsername,
                ),
                SizedBox(height: 10),
                // TextField(
                //   decoration: InputDecoration(
                //     labelText: 'Email',
                //     border: OutlineInputBorder(),
                //   ),
                //   onChanged: controller.setEmail,
                // ),
                Obx(() => TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    errorText: controller.emailError.value.isEmpty ? null : controller.emailError.value,
                  ),
                  onChanged: controller.setEmail,
                )),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: controller.setPassword,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.signUp,
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
