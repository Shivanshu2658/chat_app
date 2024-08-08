import 'package:chat_app/add_users/add_users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }

        final bool pop = await _showBackDialog(context);

        if (pop == true) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: Center(
          child: Text("Home"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(()=> AddUserScreen());
          },
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }

  Future<bool> _showBackDialog(BuildContext context) async {
    bool b = false;
    bool a = await Get.dialog(AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text("Wanna Leave??"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        b = true;
                        Get.back();
                      },
                      child: Text("Yes")),
                  ElevatedButton(
                      onPressed: () {
                        b = false;
                        Get.back();
                      },
                      child: Text("No")),
                ],
              ),
            ],
          ),
        )) ??
        b;
    return a;
  }
}
