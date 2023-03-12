import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';
import 'package:sneakers_shop/src/pages/cart/cart_controller.dart';

class CartScreen extends GetView<CartController> {
  static const routeName = '/cart-screen';
  CartScreen({super.key});

  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print('controller.myCardList---${controller.myCardList}');
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: controller.myCardList.isNotEmpty
                  ? ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.myCardList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                                'assets/images/${controller.myCardList[index].image}'),
                          ),
                          title: Text(controller.myCardList[index].name),
                          subtitle:
                              Text('${controller.myCardList[index].price}'),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        height: 16,
                        thickness: 2,
                      ),
                    )
                  : Container(color: Colors.red),
            ),
            Container(
              alignment: Alignment.center,
              height: 80,
              width: 200,
              color: Colors.lightBlue,
              child: Text(
                'Total price: \$${controller.totalPrice}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
