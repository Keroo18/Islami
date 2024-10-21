import 'package:flutter/material.dart';
import 'package:islami_r/modules/radio/provider/radio_provider.dart';
import 'package:provider/provider.dart';

import '../../core/services/settings_provider.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  @override

  void disposed(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Scaffold(


      body: ChangeNotifierProvider<RadioProvider>(
        create: (context) => RadioProvider()..getRadios(),
        builder: (context, child) {
          var newProvider= Provider.of<RadioProvider>(context);
          if (newProvider.isLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (newProvider.radios.isEmpty) {
            return Center(child: const Text("No radios available"));
          }
          if (newProvider.isError) {
            return Center(child: const Text("Error loading radios"));
          }


          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    "assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png",),
                  width: 412,height: 222,
                  fit: BoxFit.cover,

                ),
                SizedBox(width: 200,height: 50,),
                Text(newProvider.curRadio.name,
                  style: theme.textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                // SizedBox(height: 10,),
                // Slider(
                //   min: 0 ,
                //   max: newProvider.duration.inSeconds.toDouble(),
                //   value: newProvider.position.inSeconds.toDouble(),
                //   onChanged: (value) async{
                //     final position =Duration(seconds: value.toInt());
                //     await newProvider.player.seek(position);
                //     await newProvider.player.resume();
                //   },
                // ),
                // SizedBox(height: 10,),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal:20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(newProvider.formatTime(newProvider.position),),
                //       Text(newProvider.formatTime(newProvider.duration -newProvider.position),),
                //     ],
                //   ),
                // ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1,),
                    IconButton(
                        onPressed: () {
                          newProvider.prev();
                        },
                      icon:Icon(Icons.arrow_back_ios),
                      color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,),
                    Spacer(flex: 1,),
                    CircleAvatar(
                      radius: 22,
                      child: IconButton(
                        onPressed: () async{
                          newProvider.play();

                        },
                        // onPressed: () {
                        //   newProvider.play();
                        // },
                        icon:Icon(newProvider.isPlaying?Icons.pause:Icons.play_arrow),
                          color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,),
                    ),
                    Spacer(flex: 1,),

                    IconButton(
                      onPressed: () {
                        newProvider.next();
                      },
                      icon:Icon(Icons.arrow_forward_ios),
                      color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,),
                    Spacer(flex: 1,),

                  ],
                ),
              ],
            ),
          );
        },

      ),



    );

  }

}






