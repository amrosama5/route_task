import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/utils/constants.dart';

@lazySingleton
class ApiManager{

  late Dio dio;

  ApiManager(){
    dio=Dio();
  }


  Future<Response> getData(String endPoint,{Map<String, dynamic>? param}){
    return dio.get(Constants.baseURL+endPoint,queryParameters: param);
  }


  Future<Response> postData(String endPoint,{Map<String, dynamic>? body}){
    return dio.post(Constants.baseURL+endPoint,data: body);
  }

}