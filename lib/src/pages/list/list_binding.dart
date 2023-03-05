import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/list/list_controller.dart';

class ListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListController>(() => ListController());
  }
}
