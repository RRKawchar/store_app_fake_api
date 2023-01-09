import 'package:flutter/material.dart';
import 'package:store_app_api/widgets/user_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("All Users"),
     ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
        return UserWidget();
      }),
    );
  }
}
