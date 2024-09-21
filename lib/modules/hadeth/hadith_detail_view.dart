import 'package:flutter/material.dart';
import 'package:islami_r/core/settings_provider.dart';
import 'package:islami_r/modules/hadeth/hadeth_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HadithDetailView extends StatelessWidget {
  static const String routeName="hadithDetail";
  const HadithDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var data=ModalRoute.of(context)?.settings.arguments as HadithData;
    var theme = Theme.of(context);
    var provider=Provider.of<SettingsProvider>(context);
    var lang=AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getHomeBackground()),

          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.islami,
          style: theme.textTheme.titleLarge,),

        ),
        body: Container(
          margin: EdgeInsets.only(
            top: 20,
            right: 30,
            left: 30,
            bottom: 90,
          ),
          decoration: BoxDecoration(
            color: provider.isDark()
              ? Color(0xFF141A2E).withOpacity(0.8)
              :Color(0xFFF8F8F8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [

                  Text(
                    data.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color:  provider.isDark()
                          ? theme.primaryColorDark.withOpacity(0.8)
                          :Colors.black.withOpacity(0.8),
                    ),
                  ),

              Divider(height: 2,),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) =>
                    Text(
                      data.body,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color:  provider.isDark()
                          ? theme.primaryColorDark.withOpacity(0.8)
                          :Colors.black.withOpacity(0.8),
                      ),

                    ),
                  itemCount: 8,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

