import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sneakers_shop/src/pages/create_product/create_product.dart';
import 'package:sneakers_shop/src/pages/list/list.dart';
import 'package:sneakers_shop/src/pages/list/list_binding.dart';

import 'package:sneakers_shop/src/pages/tabs/tabs.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Outfit',
      ),
      //home: const TabsScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const TabsScreen(),
        ),
        GetPage(
          name: ListScreen.routeName,
          page: () => ListScreen(),
          binding: ListBinding(),
        ),
        GetPage(
          name: CreateScreen.routeName,
          page: () => CreateScreen(),
        ),
        // GetPage(
        //   name: EditScreen.routeName,
        //   page: () => EditScreen(sneaker: Sn),
        // ),
      ],
    );
  }
}
