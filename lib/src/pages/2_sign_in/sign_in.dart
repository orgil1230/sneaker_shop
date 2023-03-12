import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../tabs/tabs.dart';
import 'aa_sign_in.dart';

class SignIn extends GetView<SignInController> {
  const SignIn({super.key});
  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    var myLocale = Localizations.localeOf(context);

    return SignInScreen(
      providers: [EmailAuthProvider()],
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          print('state--${state.user!.emailVerified}');
          if (!state.user!.emailVerified) {
            Get.offAndToNamed('/email-verify');
          } else {
            controller.user = state.user;
            Get.offAndToNamed(TabsScreen.routeName);
          }
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          if (state.credential.user!.emailVerified)
            Get.offAndToNamed('/email-verify');
          else
            Get.offAndToNamed(TabsScreen.routeName);
        }),
      ],
      headerBuilder: (context, constraints, _) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              'https://firebase.flutter.dev/img/flutterfire_300x.png',
            ),
          ),
        );
      },
      subtitleBuilder: (context, action) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Welcome to Soli! Please create an'
            ' account to continue',
          ),
        );
      },
      footerBuilder: (context, _) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'By signing in, you agree to our terms and conditions.',
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}
