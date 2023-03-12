import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/0_sneaker/main_controller.dart';

class HomeController extends MainController {
  RxList popularSneakers = [1, 2, 3].obs;
  RxList newestSneakers = [1, 2, 3, 4].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
