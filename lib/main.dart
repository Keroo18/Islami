import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_r/core/settings_provider.dart';
import 'package:islami_r/modules/hadeth/hadith_detail_view.dart';
import 'package:islami_r/modules/layout_view/layout_view.dart';
import 'package:islami_r/modules/qoran/sura_view.dart';
import 'package:islami_r/modules/splash/splash_view.dart';
import 'core/application_theme_management.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
          child: Islami()
      )
  );
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManagement.lightThemeData,
      darkTheme: ApplicationThemeManagement.darkThemeData,
      themeMode: provider.currentThemeMode,
      locale: Locale(provider.currentLangCode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: "/",
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayoutView.routeName: (context) => const LayoutView(),
        SuraView.routeName: (context) => const SuraView(),
        HadithDetailView.routeName: (context) => const HadithDetailView(),
      },
    );
  }
}
