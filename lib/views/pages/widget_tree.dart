import 'package:fasionrecommender/data/notifiers.dart';
import 'package:fasionrecommender/views/pages/login_page.dart';
import 'package:fasionrecommender/views/pages/onboarding_page.dart';
import 'package:fasionrecommender/views/pages/signup_page.dart';
import 'package:flutter/material.dart';
List<Widget> pages = [OnboardingPage(), LoginPage(), SignupPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectPageNotifier,
        builder: (context, value, child) {
          return pages.elementAt(value);
        },
      ),
    );
  }
}