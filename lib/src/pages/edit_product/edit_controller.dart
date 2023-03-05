import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';
import 'package:sneakers_shop/src/pages/list/list_controller.dart';

class EditController extends GetxController {
  TextEditingController urlController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final GlobalKey<FormState> saveFormKey = GlobalKey<FormState>();
  RxBool validate = false.obs;

  final listController = Get.find<ListController>();

  final Sneaker sneaker;

  EditController({required this.sneaker});

  @override
  void onInit() {
    super.onInit();
    print('onInit');
    SchedulerBinding.instance.addPostFrameCallback((Duration _) {
      urlController.text = sneaker.image;
      nameController.text = sneaker.name;
      priceController.text = sneaker.price.toString();
    });
  }

  void onSave() {
    //print('sneaker---${sneaker.name}');
    sneaker.image = urlController.text;
    sneaker.name = nameController.text;
    sneaker.price = double.parse(priceController.text);
    listController.sneakers.refresh();

    Get.back();
  }
}
