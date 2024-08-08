import 'dart:async';
import 'package:chat_app/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../home/home_screen.dart';

class NewSplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  NewSplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: AppColors.secondaryy,
        body: Sizer(
          builder: (context, or, type) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                  // AppImagePaths.appLogo,
                  // width: MediaQuery.of(context).size.width / 3.5,
                // ),
                const SizedBox(height: 20),
                Text(
                  "Chat App",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        // color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
}

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    await checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final isLogin = sp.getString("token");
    if (isLogin != null) {
      Get.off(() => HomeScreen());
    } else {
      Get.to(() =>  LoginScreen());
    }
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashScreen> {
  @override
  void initState() {
    _checkSplash();
    super.initState();
  }

  Future<void> _checkSplash() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final isLogin = sp.getString("token");
    if (isLogin != null) {
      Get.off(() => HomeScreen());
    } else {
      Get.to(() =>  LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: AppColors.secondaryy,
        body: Sizer(
          builder: (context, or, type) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   AppImagePaths.appLogo,
                //   width: MediaQuery.of(context).size.width / 3.5,
                // ),
                const SizedBox(height: 20),
                Text(
                  "Chat App",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        // color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
}
