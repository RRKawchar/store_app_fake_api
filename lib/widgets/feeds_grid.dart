import 'package:flutter/material.dart';
import 'package:store_app_api/widgets/feeds_widget.dart';

class FeedsGrid extends StatelessWidget {
  const FeedsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 0.6),
      itemBuilder: (context, index) {
        return const FeedsWidget();
      },);
  }
}
