import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';
import 'package:sneakers_shop/src/pages/list/list_controller.dart';

class CreateController extends ListController {
  TextEditingController urlController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final GlobalKey<FormState> saveFormKey = GlobalKey<FormState>();
  RxBool validate = false.obs;

  onSave() {
    String url = urlController.text;
    String name = nameController.text;
    String price = priceController.text;

    Sneaker sneaker = Sneaker(
      '',
      name: name,
      price: double.parse(price),
      image: 'shoe_green.png',
      isFav: false,
    );

    fireStore.collection('sneakers').add(sneaker.toJson()).then((value) {
      print('DocumentSnapshot added with ID: ${value.id}');
      sneakers.add(sneaker);
      sneakers.refresh();

      Get.back();
    });
  }
}
