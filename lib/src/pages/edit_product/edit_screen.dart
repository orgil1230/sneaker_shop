import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/edit_product/edit_controller.dart';

import '../../model/sneaker_model.dart';

class EditScreen extends StatelessWidget {
  static const routeName = '/edit-screen';
  late EditController controller;
  final Sneaker sneaker;

  EditScreen({required this.sneaker, super.key});

  @override
  Widget build(BuildContext context) {
    controller = EditController(sneaker: sneaker);

    controller.urlController.text = sneaker.image;
    controller.nameController.text = sneaker.name;
    controller.priceController.text = sneaker.price.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Sneaker'),
        actions: [
          IconButton(
            onPressed: () {
              controller.onSave();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Form(
            key: controller.saveFormKey,
            child: Column(children: [
              TextFormField(
                controller: controller.urlController,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  hintText: 'Sneaker image ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Name ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: 'Price ',
                  errorText: controller.validate.value
                      ? 'Value Can\'t Be Empty'
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
