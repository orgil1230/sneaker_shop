import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/create_product/create_controller.dart';

class CreateScreen extends GetView<CreateController> {
  static const routeName = '/create-screen';
  CreateController controller = Get.put(CreateController());

  CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
