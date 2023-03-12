import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';

import 'package:sneakers_shop/src/pages/cart/cart_controller.dart';

class DetailController extends GetxController {
  CartController cartController = Get.put(CartController());

  addToCart(Sneaker sneaker) {
    print('sneaker--${sneaker.name}');
    cartController.myCardList.add(sneaker);
    cartController.myCardList.refresh();
    cartController.calculateTotalPrice();
  }
}
