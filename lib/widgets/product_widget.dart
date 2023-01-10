import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/constants/global_colors.dart';
import 'package:store_app_api/models/all_product_model.dart';
import 'package:store_app_api/screens/product_details_screen.dart';

class ProductWidget extends StatelessWidget {

  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AllProductModel allProductModelProvider=Provider.of<AllProductModel>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(context, PageTransition(child:const ProductDetailsScreen(), type: PageTransitionType.fade,),);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "\$",
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold
                                // color: Color.fromARGB(33, 150, 243, 1),
                                ),
                            children: [
                          TextSpan(
                              text: "${allProductModelProvider.price}",
                              style: TextStyle(
                                  color: lightTextColor,
                                  fontWeight: FontWeight.w600))
                        ])),
                    const Icon(IconlyBold.heart)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    height: size.height * 0.2,
                    width: double.infinity,
                    errorWidget: const Icon(
                      IconlyBold.danger,
                      color: Colors.red,
                      size: 28,
                    ),
                    imageUrl:
                      allProductModelProvider.images![0],
                    boxFit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10),
               Flexible(
                 flex: 1,
                 child: Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: Text(
                    allProductModelProvider.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style:const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
              ),
               ),
              SizedBox(
                height: size.height * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }
}
