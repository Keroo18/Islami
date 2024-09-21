import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:islami_r/core/settings_provider.dart';
import 'package:provider/provider.dart';
 class SettingsView extends StatefulWidget {

  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var langList=[
    "English",
    "عربي",
  ];

  var themeList=[
    "Dark",
    "Light",
  ];

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var provider=Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 40,),

        Text('Language',
        style: theme.textTheme.titleLarge,),
      const SizedBox(height: 20,),
      CustomDropdown<String>(
        hintText: 'Select job role',
        items: langList,
        initialItem: provider.currentLangCode=="en"? langList[0]:langList[1],
        onChanged: (value) {
          if(value=="English"){
            provider.changeLangCode("en");
          }
          if(value=="عربي"){
            provider.changeLangCode("ar");
          }
          log('changing value to: $value');
        },
      ),
        SizedBox(height: 40,),
        Text('Theme',
      style: theme.textTheme.titleLarge,),
    const SizedBox(height: 20,),
    CustomDropdown<String>(
    hintText: 'Select Theme',
    items: themeList,
    initialItem: provider.currentThemeMode==ThemeMode.dark?
    themeList[0]
      :themeList[1],
    onChanged: (value) {
      if (value=="Dark"){
        provider.changeThemeMode(ThemeMode.dark);
      }
      if (value=="Light"){
        provider.changeThemeMode(ThemeMode.light);
      }
      log('changing value to: $value');

    },
    ),

        ],
      ),
    );
  }
}
