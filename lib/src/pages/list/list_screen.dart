import 'package:flutter/material.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';

import 'dump_json.dart';
import 'sneaker_item.dart';

class ListScreen extends StatefulWidget {
  static const routeName = '/list-screen';

  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Sneaker> sneakers =
      jsonSneakers.map((sneakerJson) => Sneaker.fromJson(sneakerJson)).toList();

  @override
  Widget build(BuildContext context) {
    sneakers[2].isFav = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sneakers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 15),
        itemBuilder: (BuildContext context, int index) {
          return SneakerItem(
            sneaker: sneakers[index],
          );
        },
      ),
    );
  }
}
