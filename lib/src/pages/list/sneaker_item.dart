import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';
import 'package:sneakers_shop/src/pages/detail/detail.dart';
import 'package:sneakers_shop/src/pages/list/list_controller.dart';

import '../../theme/my_colors.dart';

class SneakerItem extends StatelessWidget {
  int index;
  final listController = Get.find<ListController>();

  SneakerItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(DetailScreen.routeName);
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyColors.homePopularBg,
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: const Text('Please Confirm'),
                                content: const Text(
                                    'Are you sure to edit the sneaker?'),
                                actions: [
                                  // The "Yes" button
                                  TextButton(
                                      onPressed: () {
                                        // Remove the sneaker
                                        listController.onTapEdit(index);
                                        // Close the dialog
                                      },
                                      child: const Text('Yes')),
                                  TextButton(
                                      onPressed: () {
                                        // Close the dialog
                                        Get.back();
                                      },
                                      child: const Text('No'))
                                ],
                              );
                            });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.edit_outlined),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: const Text('Please Confirm'),
                                content: const Text(
                                    'Are you sure to remove the sneaker?'),
                                actions: [
                                  // The "Yes" button
                                  TextButton(
                                      onPressed: () {
                                        // Remove the sneaker
                                        listController.onTapDelete(index);
                                        // Close the dialog
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Yes')),
                                  TextButton(
                                      onPressed: () {
                                        // Close the dialog
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('No'))
                                ],
                              );
                            });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.delete_outline),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        listController.onTapFavourite(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(listController.sneakers[index].isFav
                            ? Icons.favorite
                            : Icons.favorite_outline),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 149,
                  height: 116,
                  child: Image.asset(
                      'assets/images/${listController.sneakers[index].image}'),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                TextSpan(text: listController.sneakers[index].name),
                TextSpan(
                    text: '\n\$ ${listController.sneakers[index].price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
