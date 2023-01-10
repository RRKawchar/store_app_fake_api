import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/constants/global_colors.dart';
import 'package:store_app_api/models/users_model.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    final userProvider=Provider.of<UsersModel>(context);
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl:userProvider.avatar.toString(),
        boxFit: BoxFit.fill,
      ),
      title: Text(userProvider.name.toString()),
      subtitle: Text(userProvider.email.toString()),
      trailing: Text(userProvider.role.toString(),style: TextStyle(
        color: lightIconsColor,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
