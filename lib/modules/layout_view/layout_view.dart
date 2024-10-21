import 'package:flutter/material.dart';
import 'package:islami_r/core/services/settings_provider.dart';
import 'package:islami_r/modules/hadeth/hadeth_view.dart';
import 'package:islami_r/modules/qoran/qoran_view.dart';
import 'package:islami_r/modules/radio/radio_view.dart';
import 'package:islami_r/modules/sebha/sebha_view.dart';
import 'package:islami_r/modules/settings/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = "layout";

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex=0;
  List<Widget> screenList=[
    QoranView(),
    HadethView(),
    SebhaView(),
    RadioView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var lang= AppLocalizations.of(context)!;
    var provider=Provider.of<SettingsProvider>(context);
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.getHomeBackground(),),
            fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                  lang.islami,
                      style:theme.textTheme.titleLarge,
              )
          ),
        ),
        body: screenList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap:(value){
            selectedIndex=value;
            setState(() {

            });
          } ,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/icons/moshaf_blue.png')),
                label: lang.qoran
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/icons/qoran.png')),
                label: lang.hadith
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/icons/sebha_blue.png')),
                label: lang.sebha
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/icons/radio.png')),
                label: lang.radio
            ),
            BottomNavigationBarItem(icon:Icon(Icons.settings),label: lang.settings, ),
          ],
        ),
      ),
    );
  }
}
