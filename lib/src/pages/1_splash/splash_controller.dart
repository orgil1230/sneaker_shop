import 'dart:async';

import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/0_sneaker/main_controller.dart';
import 'package:sneakers_shop/src/pages/2_sign_in/aa_sign_in.dart';

import 'package:sneakers_shop/src/pages/tabs/tabs.dart';

class SplashController extends MainController {
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 1), () {
      if (user != null) {
        print('user!.displayName---${user!.displayName}');
        // if (user!.displayName != null) {
        //   Get.offAndToNamed<void>(Home.routeName);
        // } else {
        Get.offAndToNamed<void>(TabsScreen.routeName);
        //}
      } else {
        Get.offAndToNamed<void>(SignIn.routeName);
      }
    });
  }
}
