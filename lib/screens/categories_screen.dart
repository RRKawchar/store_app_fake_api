import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/constants/api_constants.dart';
import 'package:store_app_api/models/categories_model.dart';
import 'package:store_app_api/services/api_handler.dart';
import 'package:store_app_api/widgets/category_widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        body: FutureBuilder<List<CategoriesModel>>(
          future: ApiHandler.getCategories(subUrl:CATEGORIES),
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
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 0.7),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: snapshot.data![index],
                    child: const CategoryWidget());
              },
            );
          },
        ));
  }
}
