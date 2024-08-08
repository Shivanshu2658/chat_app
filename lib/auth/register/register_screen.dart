import 'package:chat_app/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterController registerController = Get.put(RegisterController());

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
                  "Want to get some crazy deals?\nSignUp Here",
                  textAlign: TextAlign.center,
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
                        onChanged: registerController.setFirstname,
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
                            hintText: "Enter First Name"),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    SizedBox(
                      child: TextField(
                        onChanged: registerController.setLastname,
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
                            hintText: "Enter Last Name"),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    SizedBox(
                      child: TextField(
                        onChanged: registerController.setUsername,
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
                            hintText: "Enter Username"),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    SizedBox(
                      child: Obx(
                         () {
                          return TextField(
                            onChanged: registerController.setEmail,
                            cursorColor: Constants().cursorColor,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                errorText: registerController.emailError.value.isEmpty ? null : registerController.emailError.value,
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
                          );
                        }
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    SizedBox(
                      child: Obx(() {
                        return TextField(
                          obscureText:
                          registerController.showLoginPassword.value == false
                              ? true
                              : false,
                          onChanged: registerController.setPassword,
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
                                  registerController.showLoginPassword.value =
                                  !registerController.showLoginPassword.value;
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 4.sp),
                                  child: registerController
                                      .showLoginPassword.value ==
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
                    Padding(
                      padding: EdgeInsets.only(
                          top: 4.sp, right: 6.sp, bottom: 0.sp, left: 0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password",
                            style: GoogleFonts.rubik(
                                fontSize: 11.sp,
                                color: Constants().buttonBackground,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () async{
                         await registerController.signUp();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Constants().buttonBackground,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.sp))),
                        child: Text(
                          "Register Here",
                          style: GoogleFonts.rubik(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 6.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.rubik(
                              fontSize: 11.sp, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.off(() => LoginScreen());
                          },
                          child: Text(
                            "Login Here",
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
