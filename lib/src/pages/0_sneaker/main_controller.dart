import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';
import 'package:sneakers_shop/src/pages/tabs/tabs.dart';

class MainController extends GetxController {
  final isLoading = false.obs;
  final noConnection = false.obs;

  late GetStorage store;

  RxBool useLightMode = false.obs;

  double screenWidth = 0;
  double screenHeight = 0;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  User? user;
  RxList<Sneaker> sneakers = <Sneaker>[].obs;
  Locale locale = const Locale('en', '');
  final List actions = [
    AuthStateChangeAction<SignedIn>((context, state) {
      if (!state.user!.emailVerified) {
        Get.offAndToNamed('/email-verify');
      } else {
        Get.offAndToNamed(TabsScreen.routeName);
      }
    }),
  ];

  @override
  void onInit() {
    super.onInit();
    user = auth.currentUser;
  }

  void handleBrightnessChange() {
    useLightMode.value = !useLightMode.value;
    Get.changeThemeMode(useLightMode.value ? ThemeMode.light : ThemeMode.dark);
  }

  void showError(String text, {bool isShow = false}) {}

  void showSuccess(String text) {}

  void showWarning(String text) {}

  // ignore: inference_failure_on_function_invocation
  void startFullLoading({String text = 'Уншиж байна'}) =>
      Get.dialog(Container());

  void stopFullLoading() => Get.back;
}
