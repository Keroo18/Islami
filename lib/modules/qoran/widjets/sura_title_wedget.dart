import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_r/modules/qoran/qoran_view.dart';
import 'package:provider/provider.dart';

import '../../../core/services/settings_provider.dart';

class SuraTitleWedget extends StatelessWidget {
  final SuraData data;

   SuraTitleWedget({super.key,

     required this.data,
   }
   );

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    var theme=Theme.of(context);

    return Row(
      children: [

        Expanded(

          child: Text(
            data.suraName,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 60,
          child: VerticalDivider(
            color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,

            thickness: 2,
          ),
        ),

        Expanded(
          child: Text(
            data.suraNumber,
            textAlign: TextAlign.center,

            style: theme.textTheme.titleMedium,
          ),
        ),


      ],

    );
  }
}
