import 'dart:async';
import 'package:flutter/material.dart';

import '../layout_view/layout_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "/";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ThemeMode currentThemeMode=ThemeMode.dark;

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LayoutView.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

      return currentThemeMode==ThemeMode.dark?
      Image.asset(
        "assets/images/splash.png",
        fit: BoxFit.cover,
      )
          :
      Stack(
        fit: StackFit.passthrough,
        children: [
          Image.asset(
            "assets/images/bg.png",
          ),
          Center(
            child: Image.asset(
              "assets/images/logo.png",

            ),
          ),
        ],
      );


  }
}
