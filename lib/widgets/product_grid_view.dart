import 'package:flutter/material.dart';
import 'package:store_app_api/models/all_product_model.dart';
import 'package:store_app_api/widgets/product_widget.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({Key? key, required this.productList}) : super(key: key);
  final List<AllProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        return ProductWidget(
          imageUrl: productList[index].images![0].toString(),
          title: productList[index].title.toString(),
        );
      },);
  }
}
