import 'package:flutter/cupertino.dart';

class CategoriesModel with ChangeNotifier{
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoriesModel({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  static List<CategoriesModel> categoriesFromSnapshot(List  categoriesSnapshot){
    return categoriesSnapshot.map((data){
      return CategoriesModel.fromJson(data);

    }).toList();
  }


}