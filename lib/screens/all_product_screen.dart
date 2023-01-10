import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/constants/api_constants.dart';
import 'package:store_app_api/models/all_product_model.dart';
import 'package:store_app_api/services/api_handler.dart';
import 'package:store_app_api/widgets/product_widget.dart';

class AllProdcutScreen extends StatefulWidget {
  const AllProdcutScreen({Key? key}) : super(key: key);

  @override
  State<AllProdcutScreen> createState() => _AllProdcutScreenState();
}

class _AllProdcutScreenState extends State<AllProdcutScreen> {

  List<AllProductModel> productList=[];

  @override
  void didChangeDependencies() {
      getProduct();
    super.didChangeDependencies();
  }
  Future<void> getProduct()async{

    productList=await ApiHandler.getAllProduct(subUrl:ALL_PRODUCT_URL);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product"),

      ),
      body:productList.isEmpty?const Center(
        child: CircularProgressIndicator(),
      ): GridView.builder (
          // shrinkWrap: true,
          // physics:const NeverScrollableScrollPhysics(),
          itemCount: productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 0.7
          ), itemBuilder: (context,index){
        return ChangeNotifierProvider.value(

            value: productList[index],
            child: const ProductWidget());
      }),
    );
  }
}
