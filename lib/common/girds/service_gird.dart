import 'package:bording_week1/common/widgets/service_categories.dart';
import 'package:bording_week1/dummy/dummy_data.dart';
import 'package:flutter/material.dart';

class ServiceGrid extends StatelessWidget {
  final double screenWidth;
  const ServiceGrid({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.homeGirditems.length,
      itemBuilder: (context, index) {
        final items = DummyData.homeGirditems[index];
        return ServiceCategories(
          title: items.title,
          image: items.image,
          isoffer: items.isoffer,
        );
      },
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: screenWidth / (screenWidth < 350 ? 3 : 4),
        mainAxisSpacing: 18,
        crossAxisSpacing: 1,
        childAspectRatio: 1,
      ),
    );
  }
}
