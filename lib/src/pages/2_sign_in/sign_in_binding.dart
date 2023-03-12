import 'package:get/get.dart';

import 'aa_sign_in.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
  }
}
