import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

import 'package:provider/provider.dart';

import '../../core/settings_provider.dart';


class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  int counter = 0;
  double rotation = 0.0;

  void incrementCounter() {
    setState(() {
      counter==100? counter=0:counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 130,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: 80,
                      child: Image.asset(
                        "assets/images/head of seb7a.png",
                        color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,
                        height: 73,
                        width: 100,
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,

                children: [
                  Container(
                      height:310,
                  child: GestureDetector(
                    child: Transform.rotate(
                      angle: rotation,
                      child: Image.asset(
                        "assets/images/body of seb7a.png",
                        color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,
                        height: 234,
                        width: 232,
                      ),
                    ),
                  ),
                 ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
              "عدد التسبيحات",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 20),
          FilledButton(
            onPressed: () {

            },
              style: FilledButton.styleFrom(
                backgroundColor: provider.isDark()?Color(0xFF141A2E):theme.primaryColor.withOpacity(.7),

              ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                '$counter',
                style: theme.textTheme.titleSmall,
                ),
              ),
            ),

          SizedBox(height: 15,),
          FilledButton(
            onPressed: () {
              incrementCounter();
                rotation += pi / 33; // Rotate by 45 degrees (pi/4 radians)
            },
            style: FilledButton.styleFrom(
              backgroundColor: provider.isDark()?theme.primaryColorDark:theme.primaryColor,

            ),
            child: Text(tasbehText(counter),
    style: theme.textTheme.titleSmall,
    textAlign: TextAlign.center,
    ),
          ),
        ],
      ),
    );
  }
   String  tasbehText(int counter){
    if(counter<=33){
      return "سبحان الله";
    }else if(counter<=66){
      return "الحمد لله ";
    }else if(counter<=99){
      return "الله اكبر";
    }else if(counter==100){
      return '''لا اله الا الله وحده لا شريك له
    الملك وله الحمد يحيي ويميت 
    وهو على كل شيء قدير''';
    }
    return'''لا اله الا الله وحده لا شريك له
    الملك وله الحمد يحيي ويميت 
    وهو على كل شيء قدير''';
  }


}
