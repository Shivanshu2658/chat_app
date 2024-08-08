import 'package:chat_app/add_users/add_users_controller.dart';
import 'package:chat_app/chats/chat_controller.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.index});

  final index;

  final ChatController chatController = Get.put(ChatController());
  final addUserController = Get.find<AddUserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants().scaffoldBackground,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Constants().buttonBackground,
              foregroundColor: Constants().appbarForeground,
                child: Text(addUserController
                        .response?.users?[index].userName?[0]
                        .toUpperCase() ??
                    ""),
            ),
            const SizedBox(width: 10,),
            Text("${addUserController
                .response?.users?[index].firstName} ${addUserController
                .response?.users?[index].lastName}" ?? "", style: GoogleFonts.rubik(fontSize: 16.sp, fontWeight: FontWeight.w500))
          ],
        ),
        titleSpacing: 0,
        backgroundColor: Constants().appbarBackground,
        foregroundColor: Constants().appbarForeground,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Obx(() {
            //   if (chatController.chatList.isEmpty) {
            //     return Center(
            //         child: Text('No users found',
            //             style: GoogleFonts.rubik(fontSize: 12.sp)));
            //   } else {
            //     return Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding:
            //           const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            //           child: Text("All Users",
            //               textAlign: TextAlign.start,
            //               style: GoogleFonts.rubik(fontSize: 12.sp)),
            //         ),
            //         ListView.builder(
            //           itemCount: chatController.response?.chats?.length,
            //           physics: const NeverScrollableScrollPhysics(),
            //           shrinkWrap: true,
            //           itemBuilder: (context, index) {
            //             final user = chatController.response?.chats?[index];
            //             return ListTile(
            //               leading: CircleAvatar(
            //                 backgroundColor: Constants().buttonBackground,
            //                 foregroundColor: Constants().appbarForeground,
            //                 child: Text(user?.message?[0].toUpperCase() ?? ""),
            //               ),
            //               title: Text("${user?.message} ${user?.message}" ?? "",
            //                   style: GoogleFonts.rubik(fontSize: 12.sp)),
            //               subtitle: Text(user?.message ?? "",
            //                   style: GoogleFonts.rubik(fontSize: 9.sp)),
            //               onTap: () {
            //                 // Handle user tap
            //               },
            //             );
            //           },
            //         ),
            //       ],
            //     );
            //   }
            // }),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 40,
                  itemBuilder: (BuildContext context, int index) {
                              return Text("ksdnkner");
              }),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            )
          ],
        )
      ),
    );
  }
}
