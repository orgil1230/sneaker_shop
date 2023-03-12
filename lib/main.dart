import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sneakers_shop/firebase_options.dart';
import 'package:sneakers_shop/src/pages/1_splash/splash.dart';
import 'package:sneakers_shop/src/pages/1_splash/splash_binding.dart';
import 'package:sneakers_shop/src/pages/2_sign_in/aa_sign_in.dart';
import 'package:sneakers_shop/src/pages/cart/cart_binding.dart';
import 'package:sneakers_shop/src/pages/cart/cart_screen.dart';
import 'package:sneakers_shop/src/pages/create_product/create_product.dart';
import 'package:sneakers_shop/src/pages/detail/detail.dart';
import 'package:sneakers_shop/src/pages/home/home_binding.dart';
import 'package:sneakers_shop/src/pages/home/home_screen.dart';
import 'package:sneakers_shop/src/pages/list/list.dart';
import 'package:sneakers_shop/src/pages/list/list_binding.dart';

import 'package:sneakers_shop/src/pages/tabs/tabs.dart';
import 'package:sneakers_shop/src/pages/0_sneaker/main_binding.dart';

Future<void> main() async {
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialBinding: MainBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const Splash(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: SignIn.routeName,
          page: () => const SignIn(),
          binding: SignInBinding(),
        ),
        GetPage(
          name: '/email-verify',
          page: () => EmailVerificationScreen(
            actions: [
              EmailVerifiedAction(() {
                Get.offAndToNamed(TabsScreen.routeName);
              }),
              AuthCancelledAction((context) {
                //FirebaseUIAuth.signOut(context: context);
                //Navigator.pushReplacementNamed(context, '/');
              }),
            ],
          ),
        ),
        GetPage(
          name: TabsScreen.routeName,
          page: () => const TabsScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
        ),
        GetPage(
            name: CartScreen.routeName,
            page: () => CartScreen(),
            binding: CartBinding()),
        GetPage(
          name: ListScreen.routeName,
          page: () => ListScreen(),
          binding: ListBinding(),
        ),
        GetPage(
          name: CreateScreen.routeName,
          page: () => CreateScreen(),
        ),
      ],
    );
  }
}
