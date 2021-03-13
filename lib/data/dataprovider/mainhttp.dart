import 'dart:convert';

import 'package:flowers/data/models/authmodel.dart';
import 'package:flowers/data/models/mainmodel.dart';
import 'package:http/http.dart';

class MainHttps {
  //http://fl.route.uz/clintapi/category
  //http://fl.route.uz/clintapi/products
  static String baseUrl = "fl.route.uz";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };
    static String urlCategories = "/clintapi/category";
    static String urlAuth = "/clintapi/auth";
    static String urlProduct = "/clintapi/products";


    static Future<String> getMain({String api, Map<String, dynamic> params}) async{
      var uri = Uri.http(baseUrl, api);
      var response  = await get(uri, headers: headers);
      if(response.statusCode == 200){
        return response.body;
        }else
          return "xato ma'lumot yuklanmadi";
    }

  static Map<String, dynamic> emptParams(){
    Map<String, dynamic> maps = new Map();
    return  maps;
  }

    static MainModel parseModel(String response){
      dynamic json = jsonDecode(response);
      var data  = MainModel.fromJson(json);
      return data;
    }

  static GetDataMain parseModel2(String response){
    dynamic json = jsonDecode(response);
    var data  = GetDataMain.fromJson(json);
    return data;
  }

  static AuthModel parseAuth({String response}){
      dynamic json = jsonDecode(response);
      var data = AuthModel.fromJson(json);
      return data;

  }
  static AuthData parseAuthData({String data}){
      dynamic json  = jsonDecode(data);
      var dataa = AuthData.fromJson(json);
      return dataa;
}

  static Map<String, dynamic> sendAccessToken({String accessToken}){
      Map<String, String> maps = {
        "access_token":"$accessToken"
      };
      return maps;
  }



}
