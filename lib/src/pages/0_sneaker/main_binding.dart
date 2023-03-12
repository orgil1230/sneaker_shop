import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/0_sneaker/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(MainController.new);
  }
}
