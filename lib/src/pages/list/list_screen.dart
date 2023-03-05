import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/create_product/create_product.dart';
import 'package:sneakers_shop/src/pages/list/list_controller.dart';

import '../../theme/my_colors.dart';
import 'sneaker_item.dart';

class ListScreen extends GetView<ListController> {
  static const routeName = '/list-screen';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Popular'),
        ),
        body: controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.sneakers.isEmpty
                ? const Center(
                    child: Text('Empty'),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.sneakers.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 15),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == controller.sneakers.length) {
                        return InkWell(
                          onTap: () => controller.onTapCreate,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: MyColors.homePopularBg,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: const Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                        );
                      } else {
                        return SneakerItem(
                          index: index,
                        );
                      }
                    },
                  ),
      ),
    );
  }
}
