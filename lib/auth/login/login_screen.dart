
import 'package:chat_app/auth/login/login_controller.dart';
import 'package:chat_app/auth/register/register_screen.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants().scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.35,
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset("assets/images/login.svg"),
              ),
              SizedBox(
                height: 12.sp,
              ),
              SizedBox(
                child: Text(
                  "Please enter the details to continue",
                  style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 12.sp,
              ),
              Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.sizeOf(context).height * 0.5),
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      child: TextField(
                        controller: loginController.loginEmailController,
                        onChanged: (value) {
                          loginController.loginEmail.value = value;
                        },
                        cursorColor: Constants().cursorColor,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 9.sp, horizontal: 8.sp),
                            isDense: true,
// border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.sp),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.sp),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0.0)),
                            hintText: "Enter Email"),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    SizedBox(
                      child: Obx(() {
                        return TextField(
                          controller: loginController.loginPasswordController,
                          obscureText:
                          loginController.showLoginPassword.value == false
                              ? true
                              : false,
                          onChanged: (value) {
                            loginController.loginPassword.value = value;
                          },
                          cursorColor: Constants().cursorColor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 9.sp, horizontal: 8.sp),
                            isDense: true,
// border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.0),
                            ),
                            hintText: "Enter Password",
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  loginController.showLoginPassword.value =
                                  !loginController.showLoginPassword.value;
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 4.sp),
                                  child:
                                  loginController.showLoginPassword.value ==
                                      false
                                      ? Icon(
                                    Icons.visibility,
                                    size: 16.sp,
                                  )
                                      : Icon(
                                    Icons.visibility_off,
                                    size: 16.sp,
                                  ),
                                )),

                            suffixIconConstraints:
                            BoxConstraints.tight(Size(25.sp, 20.sp)),
                          ),
                        );
                      }),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       top: 4.sp, right: 6.sp, bottom: 0.sp, left: 0.sp),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Text(
                    //         "Forgot Password",
                    //         style: GoogleFonts.rubik(
                    //             fontSize: 11.sp,
                    //             color: Constants().buttonBackground,
                    //             fontWeight: FontWeight.w400),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 10.sp),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () async {
                          await loginController.loginMethod();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Constants().buttonBackground,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.sp))),
                        child: Obx(() {
                          return loginController.isLoading.value == true
                              ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Logging in",
                                style: GoogleFonts.rubik(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4.sp,
                              ),
                              SizedBox(
                                  height: 12.sp,
                                  width: 12.sp,
                                  child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2,))
                            ],
                          )
                              : Text(
                            "Login Here",
                            style: GoogleFonts.rubik(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 6.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.rubik(
                              fontSize: 11.sp, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.off(() => RegisterScreen());
                          },
                          child: Text(
                            "SignUp Here",
                            style: GoogleFonts.rubik(
                                fontSize: 11.sp,
                                color: Constants().buttonBackground,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
// height: 400,
// child: Text("kjsjvbh"),
              )
            ],
          ),
        ),
      ),
    );
  }
}