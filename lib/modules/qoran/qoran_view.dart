import 'package:flutter/material.dart';
import 'package:islami_r/modules/qoran/sura_view.dart';
import 'package:islami_r/modules/qoran/widjets/sura_title_wedget.dart';
import 'package:provider/provider.dart';

import '../../core/services/settings_provider.dart';

class QoranView extends StatelessWidget {
  QoranView({super.key});

  final List<String> suraNames =[
  "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/icons/quran_header_icn.png',
          height: 205,
          width: 227,
        ),
         Divider(
          color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,
         ),
        Row(
          children: [
            Expanded(
              child: Text(
                'اسم السورة',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 60,
              child: VerticalDivider(
                color:provider.isDark()?theme.primaryColorDark: theme.primaryColor,
                thickness: 2,
              ),
            ),
            Expanded(
              child: Text(
                'رقم السورة',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ],
        ),
         Divider(
          color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context,
                    SuraView.routeName,
                    arguments: SuraData(
                      suraNumber: (index + 1).toString(),

                      suraName: suraNames[index],
                    ),
                );

              },
              child: SuraTitleWedget(
                data: SuraData(
                  suraName: suraNames[index],
                  suraNumber: (index + 1).toString(),
                ),
              ),
            ),
            itemCount: suraNames.length,
          ),
        ),

      ],
    );
  }
}

class SuraData {
  final String suraNumber;
  final String suraName;


  SuraData({
    required this.suraNumber,
    required this.suraName,

  });
}
