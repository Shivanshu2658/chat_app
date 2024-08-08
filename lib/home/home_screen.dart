import 'package:chat_app/add_users/add_users_screen.dart';
import 'package:chat_app/chats/chat_screen.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/home/home_chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final HomeChatController homeChatController = Get.put(HomeChatController());

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
        appBar: AppBar(
          title: Text('Home',
              style: GoogleFonts.rubik(
                  fontSize: 16.sp, fontWeight: FontWeight.bold)),
          backgroundColor: Constants().appbarBackground,
          foregroundColor: Constants().appbarForeground,
          elevation: 0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Obx(() {
            if (homeChatController.userList.isEmpty) {
              return Center(
                  child: Text('No users found',
                      style: GoogleFonts.rubik(fontSize: 12.sp)));
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  ListView.builder(
                    itemCount: homeChatController.response?.connectedUsers?.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final user =
                      homeChatController.response?.connectedUsers?[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Constants().buttonBackground,
                          foregroundColor: Constants().appbarForeground,
                          child: Text(user?[0].toUpperCase() ?? ""),
                        ),
                        title: Text("${user} ${user}" ?? "",
                            style: GoogleFonts.rubik(fontSize: 12.sp)),
                        subtitle: Text(user ?? "",
                            style: GoogleFonts.rubik(fontSize: 9.sp)),
                        onTap: () {
                          Get.off(() => ChatScreen());
                        },
                      );
                    },
                  ),
                ],
              );
            }
          }),
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
