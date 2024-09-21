import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_r/core/settings_provider.dart';
import 'package:islami_r/modules/qoran/qoran_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SuraView extends StatefulWidget {
  static const String routeName = 'suraView';
  const SuraView({super.key});


  @override
  State<SuraView> createState() => _SuraViewState();
}

class _SuraViewState extends State<SuraView> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;
    var theme = Theme.of(context);
    var provider=Provider.of<SettingsProvider>(context);
    if(content.isEmpty) loudData(data.suraNumber);
    var lang= AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getHomeBackground()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              lang.islami,
            style: theme.textTheme.titleLarge,
          ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),

                  Text(
                    ' سورة ${data.suraName}',
                    style: theme.textTheme.titleSmall?.copyWith(
                     color:  provider.isDark()
                         ? theme.primaryColorDark.withOpacity(0.8)
                         :Colors.black.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.play_circle_rounded,
                  color: provider.isDark()
                      ? theme.primaryColorDark.withOpacity(0.8)
                      :Colors.black.withOpacity(0.8),
                  ),
                ],
              ),
              Divider(height: 40,),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) =>
                    Text(
                        "{${index+1}}${versesList[index]}",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                       color:  provider.isDark()
                            ? theme.primaryColorDark.withOpacity(0.8)
                            :Colors.black.withOpacity(0.8),

                      ),
                    ),
                itemCount: versesList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String content="";
  List<String> versesList=[];

  Future<void> loudData(String suraNumber) async {
    content=await rootBundle.loadString("assets/files/$suraNumber.txt");
    versesList=content.split("\n");
    setState(() {});
  }
}
