import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:islami_r/core/services/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

 class SettingsView extends StatefulWidget {

  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var langList=[
    "English",
    "العربية",
  ];


  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var lang= AppLocalizations.of(context)!;
    var themeList=[
      lang.dark,
      lang.light,
    ];

    var provider=Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 40,),

        Text(lang.language,
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
          if(value=="العربية"){
            provider.changeLangCode("ar");
          }
          log('changing value to: $value');
        },
      ),
        SizedBox(height: 40,),
        Text(lang.theme,
      style: theme.textTheme.titleLarge,),
    const SizedBox(height: 20,),
    CustomDropdown<String>(
    hintText: 'Select Theme',
    items: themeList,
    initialItem: provider.currentThemeMode==ThemeMode.dark?
    themeList[0]
      :themeList[1],
    onChanged: (value) {
      if (value==lang.dark){
        provider.changeThemeMode(ThemeMode.dark);
      }
      if (value==lang.light){
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
