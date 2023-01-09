import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app_api/constants/global_colors.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTczsjTL_lzjUA7_O6DN10t3xxtelFRYMQY1L_GP95Qz9viWIiAde15Tzl_PeKFXBIvYgw&usqp=CAU",
        boxFit: BoxFit.fill,
      ),
      title: Text("User name"),
      subtitle: Text("Email@gmail.com"),
      trailing: Text("user role",style: TextStyle(
        color: lightIconsColor,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
