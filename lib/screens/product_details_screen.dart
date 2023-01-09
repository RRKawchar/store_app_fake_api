import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app_api/constants/global_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final textStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    const Text(
                      "Category",
                      style: TextStyle(
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
                            "Lorem Ipsum",
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
                                    text: "168.00",
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
                                "https://tse4.mm.bing.net/th?id=OIP.d-7UFbAaPsT2y3dYpaKm1AHaFb&pid=Api&P=0",
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
                          const Text(
                            "Lorem Ipsum er rett og slett dummytekst fra og for trykkeindustrien. "
                            "Lorem Ipsum har vært "
                            "bransjens standard for dummytekst helt siden 1500-tallet, da en"
                            " ukjent boktrykker stokket en mengde bokstaver for å lage et prøveeksemplar av en bok. Lorem Ipsum har tålt tidens "
                            "tann usedvanlig godt, og har i tillegg til å bestå gjennom"
                            " fem århundrer også tålt spranget over til elektronisk typografi uten vesentlige endringer.",
                            textAlign: TextAlign.start,
                          style: TextStyle(
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
