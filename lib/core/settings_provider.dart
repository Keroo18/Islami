import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
   String currentLangCode="ar";
   ThemeMode currentThemeMode=ThemeMode.light;
   void changeLangCode(String newLangCode){

      if (currentLangCode==newLangCode)return;
      currentLangCode= newLangCode;
      notifyListeners();
   }

   void changeThemeMode(ThemeMode newThemeMode){

      if (currentThemeMode==newThemeMode)return;
      currentThemeMode= newThemeMode;
      notifyListeners();
   }

   String getHomeBackground(){
      return currentThemeMode==ThemeMode.light? "assets/images/beck_ground.png" :"assets/images/home_dark_background.png";
   }


   isDark(){
      return currentThemeMode==ThemeMode.dark;
   }
}