import 'package:islami_r/models/radio_model.dart';

class RadioListModel{
 final List<RadioModel> radios;
 RadioListModel({required this.radios});

 factory RadioListModel.fromJson(Map<String,dynamic>json) {
    return RadioListModel(
      radios: (json["radios"] as List)
          .map((element) => RadioModel.fromJson(element as Map<String,dynamic>))
          .toList(),
    );
  }
}