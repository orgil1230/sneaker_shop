import 'package:flutter/material.dart';
import 'package:sneakers_shop/src/pages/list/list.dart';

import 'package:sneakers_shop/src/pages/tabs/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Outfit',
      ),
      //home: const TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const TabsScreen(),
        ListScreen.routeName: (context) => const ListScreen(),
      },
    );
  }
}
