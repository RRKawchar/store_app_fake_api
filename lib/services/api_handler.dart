import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app_api/constants/api_constants.dart';
import 'package:store_app_api/models/all_product_model.dart';
class ApiHandler{

 static Future<List<AllProductModel>> getProduct(String baseUrl,String subUrl)async{
   var uri=Uri.https(baseUrl,subUrl);
    var response=await http.get(uri);
   // print("Response : ${jsonDecode(response.body)}");

    var data = jsonDecode(response.body);
    List tempList=[];
   for(var v in data){
     tempList.add(v);

   }
    var jsonData=AllProductModel.allProductFromSnapshot(tempList);
    return jsonData;


  }
}