import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/pages.dart';
import 'package:sneakers_shop/src/theme/my_textstyles.dart';

class TitleRow extends StatelessWidget {
  final String title;

  const TitleRow({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.of(context)
            //     .pushNamed(ListScreen.routeName, arguments: 'popular');
            Get.toNamed(ListScreen.routeName);
          },
          // print('snackbar');
          // Get.defaultDialog(title: 'haha');

          child: Container(
            margin: const EdgeInsets.only(right: 18),
            child: const Text(
              'See more',
              style: MyTextStyles.seeMoreStyle,
            ),
          ),
        ),
      ],
    );
  }
}
