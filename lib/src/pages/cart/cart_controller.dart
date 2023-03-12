import 'package:get/get.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';
import 'package:sneakers_shop/src/pages/0_sneaker/main_controller.dart';

class CartController extends MainController {
  RxList<Sneaker> myCardList = <Sneaker>[].obs;
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  calculateTotalPrice() {
    print('totalPrice----${totalPrice}');
    print('myCardList----${myCardList.length}');
    myCardList.map((element) {
      totalPrice.value += element.price;
      totalPrice.refresh();
    }).toList();
    print('totalPrice----${totalPrice}');
  }
}
