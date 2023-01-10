import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app_api/constants/global_colors.dart';
import 'package:store_app_api/models/all_product_model.dart';
import 'package:store_app_api/services/api_handler.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String id;
  const ProductDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final textStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  AllProductModel? productList;
  bool isError=false;
  String errorStr="";
  Future<void> getProductInfo()async{
      try{

        productList=await ApiHandler.getProductById(id:widget.id);

      }catch(error){
        isError=true;
        errorStr=error.toString();
       throw error.toString();
      }

    setState(() {
    });
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child:isError? Center(
          child: Text("An error occured $errorStr",style:const TextStyle(
            fontSize: 20,fontWeight: FontWeight.w700
          ),),
        ):productList==null?const Center(
          child: CircularProgressIndicator(),
        ): SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      productList!.category!.name.toString(),
                      style:const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            productList!.title.toString(),
                            style: textStyle,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                              text: "\$",
                              style: const TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1),
                                fontSize: 25,
                              ),
                              children: [
                                TextSpan(
                                    text: productList!.price.toString(),
                                    style: TextStyle(
                                        color: lightTextColor,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      height: size.height * 0.4,
                      child: Swiper(
                        itemBuilder: (context, index) {
                          return FancyShimmerImage(
                            width: double.infinity,
                            imageUrl:
                                productList!.images![index].toString(),
                            boxFit: BoxFit.fill,
                          );
                        },
                        itemCount: 3,
                        autoplay: true,
                        pagination: const SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                            color: Colors.blue,
                            activeColor: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: textStyle,
                          ),
                          const SizedBox(height: 18),
                           Text(
                           productList!.description.toString(),
                            textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 25
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
