  import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami_r/core/services/api/api_constants.dart';
import 'package:islami_r/models/radio_list_model.dart';
import 'package:islami_r/models/radio_model.dart';

class ApiManager{
static final Dio _dio=Dio(
  BaseOptions(
    baseUrl: ApiConstants.baseUrl,
  ),
);
// static Future<Either<String,List<RadioModel>>> getRadios()async{
//   try{
//       var response = await _dio.get(EndPoints.radios);
//       var radios = RadioListModel.fromJson(response.data).radios;
//       return Right(radios);
//     } catch(e){
//     return Left(e.toString(),);
//   }
//   }
  static Future<Either<String, List<RadioModel>>> getRadios() async {
    try {
      var response = await _dio.get(EndPoints.radios);
      print("API Response: ${response.data}"); // Log the API response
      var radios = RadioListModel
          .fromJson(response.data)
          .radios;
      return Right(radios);
    } catch (e) {
      print("API Error: $e"); // Log the exception
      return Left(e.toString());
    }
  }
}