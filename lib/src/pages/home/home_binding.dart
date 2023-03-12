import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/cart/cart_controller.dart';
import 'package:sneakers_shop/src/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }
}
