import 'package:flutter/material.dart';

class UsersModel with ChangeNotifier{
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  UsersModel(
      {this.id,
        this.email,
        this.password,
        this.name,
        this.role,
        this.avatar,
        this.creationAt,
        this.updatedAt});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  static List<UsersModel> usersFromSnapshot(List userSnapshot){

    return userSnapshot.map((data){
      return UsersModel.fromJson(data);
    }).toList();
  }

}