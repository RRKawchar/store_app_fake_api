import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app_api/constants/api_constants.dart';
import 'package:store_app_api/models/all_product_model.dart';
import 'package:store_app_api/models/categories_model.dart';
import 'package:store_app_api/models/users_model.dart';

class ApiHandler {
  static Future<List<dynamic>> getData({
    required String subUrl,
    String? limit,
  }) async {
    try {
      var uri = Uri.https(
          BASE_URL,
          "api/v1/$subUrl",
          subUrl == "products"
              ? {
                  'offset': '0',
                   'limit':limit
                }
              : {});
      var response = await http.get(uri);
      // print("Response : ${jsonDecode(response.body)}");
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }

      List tempList = [];
      for (var v in data) {
        tempList.add(v);
      }

      return tempList;
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<List<AllProductModel>> getAllProduct(
      {required String subUrl,required String limit}) async {
    List temp = await getData(subUrl: subUrl,limit: limit);
    var jsonData = AllProductModel.allProductFromSnapshot(temp);
    return jsonData;
  }

  static Future<List<CategoriesModel>> getCategories(
      {required String subUrl}) async {
    List temp = await getData(subUrl: subUrl);
    var jsonData = CategoriesModel.categoriesFromSnapshot(temp);
    return jsonData;
  }

  static Future<List<UsersModel>> getUsers({required String subUrl}) async {
    List temp = await getData(subUrl: subUrl);
    var jsonData = UsersModel.usersFromSnapshot(temp);
    return jsonData;
  }

  static Future<AllProductModel> getProductById({required String id}) async {
    try {
      var uri = Uri.https(BASE_URL, "$ALL_PRODUCT_URL/$id");
      var response = await http.get(uri);
      // print("Response : ${jsonDecode(response.body)}");

      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }

      return AllProductModel.fromJson(data);
    } catch (error) {
      throw error.toString();
    }
  }
}
