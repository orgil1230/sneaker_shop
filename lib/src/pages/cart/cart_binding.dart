import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/cart/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartController());
  }
}
