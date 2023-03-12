import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/home/home_controller.dart';
import 'package:sneakers_shop/src/pages/home/widgets/header.dart';
import 'package:sneakers_shop/src/pages/home/widgets/newest_sneaker.dart';
import 'package:sneakers_shop/src/pages/home/widgets/popular_sneaker.dart';
import 'package:sneakers_shop/src/pages/home/widgets/title_row.dart';

class HomeScreen extends GetView<HomeController> {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 58, 0, 0),
      child: Column(
        children: [
          const Header(),
          const TitleRow(title: 'Popular'),
          horizontalItems(controller.popularSneakers, const PopularSneaker()),
          const SizedBox(height: 16),
          const TitleRow(title: 'Newest shoes'),
          const SizedBox(height: 16),
          horizontalItems(controller.newestSneakers, const NewestSneaker()),
        ],
      ),
    );
  }

  Widget horizontalItems(RxList list, Widget listItem) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return listItem;
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16),
      ),
    );
  }
}
