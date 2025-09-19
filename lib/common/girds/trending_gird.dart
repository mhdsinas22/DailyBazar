import 'package:bording_week1/common/widgets/trending_catgoery.dart';
import 'package:bording_week1/dummy/dummy_data.dart';
import 'package:flutter/material.dart';

class TrendingGird extends StatelessWidget {
  final double screenWidth;
  const TrendingGird({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: DummyData.trendinggirditems.length,
      itemBuilder: (context, index) {
        final items = DummyData.trendinggirditems[index];
        return TrendingCatgoery(
          image: items.image,
          title: items.title,
          subtitle: items.subtile,
          storelocation: items.storelocation,
          ratingandtime: items.ratingandtime,
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: screenWidth < 350 ? 0.5 : 0.44,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
