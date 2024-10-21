import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/settings_provider.dart';
import '../layout_view/layout_view.dart';

class SplashView extends StatefulWidget {

  static const String routeName = "/";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


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

      return Container(
        color: Colors.white,
        child: Column(
          children: [
            Spacer(flex: 5,),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: MediaQuery.of(context).size.width*.6,
              ),
            ),
            Spacer(flex: 4,),
            Text("Created By Kerlos Samir",
            style: TextStyle(
              color: Color(0xFFFACC1D),

            ),),
            Spacer(flex: 1,),


          ],
        ),

      );

  }
}
