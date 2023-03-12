import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'aa_splash.dart';

class Splash extends GetView<SplashController> {
  const Splash({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    controller
      ..screenWidth = MediaQuery.of(context).size.width
      ..screenHeight = MediaQuery.of(context).size.height;

    return const ColoredBox(
      color: Colors.green,
    );
  }
}
