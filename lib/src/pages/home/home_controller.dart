import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList popularSneakers = [1, 2, 3].obs;
  RxList newestSneakers = [1, 2, 3, 4].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
