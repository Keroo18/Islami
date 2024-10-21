import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{
   String currentLangCode="ar";
   ThemeMode currentThemeMode=ThemeMode.light;
   Future<void> changeLangCode(String newLangCode) async {


      if (currentLangCode==newLangCode)return;
      currentLangCode= newLangCode;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("lang", currentLangCode);
      notifyListeners();
   }

   Future<void> changeThemeMode(ThemeMode newThemeMode) async {

      if (currentThemeMode==newThemeMode)return;
      currentThemeMode= newThemeMode;

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("mode", currentThemeMode.name);
      notifyListeners();
   }

    Future<void> loudSettings() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? lang = prefs.getString('lang');
      String? mode = prefs.getString('mode');
      mode ?? "light";
      currentThemeMode =(mode=="dark"? ThemeMode.dark : ThemeMode.light);
      lang ?? "ar";
      currentLangCode =lang!;
      notifyListeners();
   }

   String getHomeBackground(){
      return currentThemeMode==ThemeMode.light? "assets/images/beck_ground.png" :"assets/images/home_dark_background.png";
   }


   isDark(){
      return currentThemeMode==ThemeMode.dark;
   }
}