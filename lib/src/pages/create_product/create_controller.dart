import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';
import 'package:sneakers_shop/src/pages/list/list_controller.dart';

class CreateController extends GetxController {
  TextEditingController urlController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final GlobalKey<FormState> saveFormKey = GlobalKey<FormState>();
  RxBool validate = false.obs;

  final listController = Get.find<ListController>();

  @override
  void onInit() {
    super.onInit();
  }

  onSave() {
    String url = urlController.text;
    String name = nameController.text;
    String price = priceController.text;

    var sneaker = Sneaker(
        name: name, price: double.parse(price), image: 'shoe_green.png');
    listController.sneakers.add(sneaker);
    listController.sneakers.refresh();

    Get.back();
  }
}
