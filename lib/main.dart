import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/application_theme_management.dart';
import 'package:provider/provider.dart';


import 'core/services/settings_provider.dart';
import 'modules/hadeth/hadith_detail_view.dart';
import 'modules/layout_view/layout_view.dart';
import 'modules/qoran/sura_view.dart';
import 'modules/splash/splash_view.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var provider=SettingsProvider();
  await provider.loudSettings();
  runApp(
      ChangeNotifierProvider(
        create: (context) => provider,
          child: const Islami(),
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
