import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app_api/constants/api_constants.dart';
import 'package:store_app_api/models/all_product_model.dart';
import 'package:store_app_api/models/categories_model.dart';
class ApiHandler{


    static Future<List<dynamic>> getData({required String subUrl})async{

      var uri=Uri.https(BASE_URL,subUrl);
      var response=await http.get(uri);
      // print("Response : ${jsonDecode(response.body)}");

      var data = jsonDecode(response.body);
      List tempList=[];
      for(var v in data){
        tempList.add(v);

      }

      return tempList;

    }

 static Future<List<AllProductModel>> getAllProduct({required String subUrl})async{
   List temp=await getData(subUrl: subUrl);
    var jsonData=AllProductModel.allProductFromSnapshot(temp);
    return jsonData;
  }

 static Future<List<CategoriesModel>> getCategories({required String subUrl})async{
  List temp= await getData(subUrl: subUrl);
   var jsonData=CategoriesModel.categoriesFromSnapshot(temp);
   return jsonData;


 }
}