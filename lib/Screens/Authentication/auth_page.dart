import 'package:flutter/material.dart';
import 'package:pollex/Providers/authentication_provider.dart';
import 'package:pollex/Screens/main_activity_page.dart';
import 'package:pollex/Styles/colors.dart';
import 'package:pollex/Utils/message.dart';
import 'package:pollex/Utils/router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            AuthProvider().signInWithGoogle().then((value) {
              if (value.user == null) {
                error(context, message: "Please try again");
              } else {
                nextPageOnly(context, const MainActivityPage());
              }
            });
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: const Text("Login"),
          ),
        ),
      ),
    );
     Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();}
  }
}
