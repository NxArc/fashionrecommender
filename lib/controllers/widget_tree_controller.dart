import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fasionrecommender/data/notifiers.dart';
import 'package:fasionrecommender/views/pages/homepage.dart';
import 'package:fasionrecommender/views/pages/login_page.dart';
import 'package:fasionrecommender/views/pages/onboarding_page.dart';
import 'package:fasionrecommender/views/pages/signup_page.dart';

List<Widget> pages = [
  OnboardingPage(),
  LoginPage(),
  SignupPage(),
  Home(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: selectPageNotifier,
        builder: (context, value, child) {
          return PageTransitionSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: pages[value],
          );
        },
      ),
    );
  }
}
