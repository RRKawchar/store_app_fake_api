import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/constants/global_colors.dart';
import 'package:store_app_api/models/categories_model.dart';
class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final categoryProvider=Provider.of<CategoriesModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.45,
              width: size.width * 0.45,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl:
              categoryProvider.image.toString(),
              boxFit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(categoryProvider.name.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: lightCardColor.withOpacity(0.5),
              fontSize: 24,
              fontWeight: FontWeight.bold

            ),
            ),
          )
        ],
      ),
    );
  }
}
