import 'package:chat_app/add_users/add_users_controller.dart';
import 'package:chat_app/auth/login/login_controller.dart';
import 'package:chat_app/auth/register/register_screen.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  final AddUserController addUserController = Get.put(AddUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants().scaffoldBackground,
      appBar: AppBar(
        title: Text('Users List', style: GoogleFonts.rubik(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        backgroundColor: Constants().appbarBackground,
        foregroundColor: Constants().appbarForeground,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() {
          if (addUserController.userList.isEmpty) {
            return Center(child: Text('No users found', style: GoogleFonts.rubik(fontSize: 12.sp)));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Text("All Users", textAlign: TextAlign.start, style: GoogleFonts.rubik(fontSize: 12.sp)),
                ),
                ListView.builder(
                  itemCount: addUserController.response?.users?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final user = addUserController.response?.users?[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Constants().buttonBackground,
                        foregroundColor: Constants().appbarForeground,
                        child: Text(user?.userName?[0].toUpperCase() ?? ""),
                      ),
                      title: Text("${user?.firstName} ${user?.lastName}" ?? "", style: GoogleFonts.rubik(fontSize: 12.sp)),
                      subtitle: Text(user?.userName ?? "",  style: GoogleFonts.rubik(fontSize: 9.sp)),
                      onTap: () {
                        // Handle user tap
                      },
                    );
                  },
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
