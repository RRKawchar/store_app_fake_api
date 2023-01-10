import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/constants/api_constants.dart';
import 'package:store_app_api/models/users_model.dart';
import 'package:store_app_api/services/api_handler.dart';
import 'package:store_app_api/widgets/user_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        body: FutureBuilder<List<UsersModel>>(
          future: ApiHandler.getUsers(subUrl: ALL_USERS),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("An error occured ${snapshot.error}"),
              );
            } else if (snapshot.data == null) {
              return const Center(
                child: Text("No product has been added yet"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: snapshot.data![index],
                  child: const UserWidget(),
                );
              },
            );
          },
        ));
  }
}
