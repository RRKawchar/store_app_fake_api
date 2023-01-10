import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_app_api/constants/api_constants.dart';
import 'package:store_app_api/constants/global_colors.dart';
import 'package:store_app_api/models/all_product_model.dart';
import 'package:store_app_api/screens/categories_screen.dart';
import 'package:store_app_api/screens/all_product_screen.dart';
import 'package:store_app_api/screens/user_screen.dart';
import 'package:store_app_api/services/api_handler.dart';
import 'package:store_app_api/widgets/appbar_icons.dart';
import 'package:store_app_api/widgets/product_grid_view.dart';
import 'package:store_app_api/widgets/product_widget.dart';
import 'package:store_app_api/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;

  // List<AllProductModel> productList=[];

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  // @override
  // void didChangeDependencies() {
  //    getProduct();
  //   super.didChangeDependencies();
  // }
  //
  // Future<void> getProduct()async{
  //   productList=await ApiHandler.getProduct(BASE_URL,ALL_PRODUCT_URL);
  //   setState(() {});
  // }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: AppbarIcons(
            function: () {
              Navigator.push(
                  context,
                  PageTransition(
                    child:  CategoriesScreen(),
                    type: PageTransitionType.fade,
                  ),);
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppbarIcons(
              function: () {
                Navigator.push(
                    context,
                    PageTransition(
                      child: const UsersScreen(),
                      type: PageTransitionType.fade,
                    ),);
              },
              icon: IconlyBold.user3,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 18
              ),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Search",
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).cardColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.secondary)),
                    suffixIcon: Icon(
                      Icons.search,
                      color: lightIconsColor,
                    )),
              ),
              const SizedBox(
                  height: 18
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const SaleWidget();
                          },
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              activeColor: Colors.red,
                              color: Colors.white,
                            ),
                          ),
                          autoplay: true,
                          // control: SwiperControl(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "All Products",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            const Spacer(),
                            AppbarIcons(
                                function: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const AllProdcutScreen(),
                                        type: PageTransitionType.fade,
                                      ));
                                },
                                icon: IconlyBold.arrowRight2)
                          ],
                        ),
                      ),
                    FutureBuilder<List<AllProductModel>>(
                      future: ApiHandler.getAllProduct(subUrl:ALL_PRODUCT_URL,limit: '5'),
                      builder: (context,snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return const  Center(
                          child: CircularProgressIndicator(),
                        );
                      }else if(snapshot.hasError){
                        return Center(
                          child: Text("An error occured ${snapshot.error}"),
                        );
                      }
                      else if(snapshot.data==null){
                        return const Center(
                          child: Text("No product has been added yet"),
                        );
                      }
                      return ProductGridView(productList: snapshot.data!);
                    },)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
