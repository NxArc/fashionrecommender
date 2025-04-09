import 'package:fasionrecommender/data/notifiers.dart';
import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Image(
        image: AssetImage('assets/images/app_logo.png'),
        height: 55,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (selectPageNotifier.value == 1) {
            selectPageNotifier.value = 0;
          } else if(selectPageNotifier.value > 2){
            selectPageNotifier.value = 1;
          } else{
            selectPageNotifier.value -= 1;
          }
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            isDarkModeNotifier.value = !isDarkModeNotifier.value;
          },
          icon: ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (context, isDarkmode, child) {
              return Icon(isDarkmode ? Icons.dark_mode : Icons.light_mode);
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
