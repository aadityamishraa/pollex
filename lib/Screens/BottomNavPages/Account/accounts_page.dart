import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pollex/Providers/authentication_provider.dart';
import 'package:pollex/Screens/Authentication/auth_page.dart';
import 'package:pollex/Screens/main_activity_page.dart';
import 'package:pollex/Screens/splash_screen.dart';
import 'package:pollex/Styles/colors.dart';
import 'package:pollex/Utils/message.dart';
import 'package:pollex/Utils/router.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          

          CircleAvatar(
            // backgroundImage: NetworkImage(),
          ),
          GestureDetector(
            onTap: () {
              AuthProvider().logOut().then((value) {
                // if (value == false) {
                //   error(context, message: "Please try again");
                // } else {
                nextPageOnly(context, const SplashScreen());
                // }
              });
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: const Text("Log Out"),
            ),
          ),
        ],
      ),
    );
  }
}
