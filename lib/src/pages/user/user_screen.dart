import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/1_splash/splash.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      providers: [EmailAuthProvider()],
      actions: [
        SignedOutAction((context) {
          Get.toNamed(Splash.routeName);
        })
      ],
      avatarSize: 24,
    );
  }
}
