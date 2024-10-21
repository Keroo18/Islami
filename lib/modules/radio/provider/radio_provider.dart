import 'dart:core';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_r/core/services/api/api_manager.dart';
import 'package:islami_r/models/radio_model.dart';

class RadioProvider extends ChangeNotifier{
  List<RadioModel> radios=[];
  bool isError=false;
  int _curIndex=0;
  final player=AudioPlayer();
  bool isLoading=false;
  Duration duration =Duration.zero;
  Duration position =Duration.zero;


  Future<void> getRadios() async {
    var res = await ApiManager.getRadios();
    res.fold(
          (l) {
        isLoading = false;
        isError = true;
        print("Error: $l"); // Log the error message
        notifyListeners();
      },
          (r) {
        radios = r;
        isLoading = false;
        notifyListeners();
      },
    );

  }

  RadioModel get curRadio {
    if (radios.isEmpty) {
      throw Exception('No radios available');
    }
    return radios[_curIndex];
  }

  String formatTime(Duration duration){
    String twoDigits(int n)=>n.toString().padLeft(2,"0");
    final hours=twoDigits(duration.inHours);
    final minutes=twoDigits(duration.inMinutes.remainder(60));
    final seconds=twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours>0)hours,
      minutes,
      seconds,
    ].join(":");

  }

  bool get isPlaying=>player.state==PlayerState.playing;


  void play(){
    if(player.state==PlayerState.playing){
      player.pause();
    }else if(player.state==PlayerState.paused){
      player.resume();
    }else{
      player.play(UrlSource(radios[_curIndex].url),);
    }
    notifyListeners();
  }
  next(){
    if(radios.length-1==_curIndex){
      return;
    }
    _curIndex++;
    player.stop();
    notifyListeners();
  }
  prev(){
    if(_curIndex==0){
      return;
    }
    _curIndex--;
    player.stop();
    notifyListeners();
  }


}



// Future<void>getRadios()async{
//   var res =await ApiManager.getRadios();
//   res.fold(
//           (l){
//             isLoading=false;
//             isError=true;
//             notifyListeners();
//           },
//           (r){
//             radios=r;
//             isLoading=false;
//           }
//   );
//   notifyListeners();
// }