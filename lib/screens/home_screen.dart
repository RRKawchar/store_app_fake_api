import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app_api/constants/global_colors.dart';
import 'package:store_app_api/widgets/appbar_icons.dart';
import 'package:store_app_api/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;

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
            function: () {},
            icon: IconlyBold.category,
          ),
          actions: [
            AppbarIcons(
              function: () {},
              icon: IconlyBold.user3,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
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
            ],
          ),
        ),
      ),
    );
  }
}