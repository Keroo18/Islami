import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/settings_provider.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Scaffold(


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                "assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png",),
              width: 412,height: 222,
              fit: BoxFit.cover,

            ),
            SizedBox(width: 200,height: 50,),
            Text("إذاعة القرآن الكريم",
              style: theme.textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 1,),
                InkWell(child: Image(image: AssetImage("assets/images/Icon metro1-next.png"),
                color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,)),
                Spacer(flex: 1,),
                InkWell(child: Image(image: AssetImage("assets/images/Icon awesome-play.png"),
                  color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,)),
                Spacer(flex: 1,),

                InkWell(child: Image(image: AssetImage("assets/images/Icon metro-next.png"),
                  color:provider.isDark()?theme.primaryColorDark:theme.primaryColor,)),
                Spacer(flex: 1,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}






