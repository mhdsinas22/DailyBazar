import 'package:bording_week1/common/const/appcolors.dart';
import 'package:bording_week1/common/const/appimages.dart';
import 'package:bording_week1/common/const/constfunctions/text_formfiled_function.dart';
import 'package:bording_week1/common/const/styles/buttons/button_circular_rounded.dart';
import 'package:bording_week1/common/const/styles/texts/bold_text.dart';
import 'package:bording_week1/common/const/styles/texts/custom_font.dart';
import 'package:bording_week1/common/const/styles/texts/medium_font.dart';
import 'package:bording_week1/common/const/styles/texts/semibold.dart';
import 'package:bording_week1/common/widgets/home_screen_appbar.dart';
import 'package:bording_week1/common/widgets/nearby_stores_widget.dart';
import 'package:bording_week1/common/widgets/referandearn_conantier.dart';
import 'package:bording_week1/common/widgets/service_categories.dart';
import 'package:bording_week1/common/widgets/trending_catgoery.dart';
import 'package:bording_week1/dummy/dummy_data.dart';
import 'package:bording_week1/common/utils/navgtor.dart';
import 'package:bording_week1/views/otherscreen/notifications_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: HomeScreenappabr(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.015,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔥 Search + Notification + Offer Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Appcolors.whitegrey,
                        suffixIcon: Icon(
                          Icons.search,
                          color: Appcolors.appgreen,
                          size: 30,
                        ),
                        hintText: "Search for products/stores",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015,
                          horizontal: screenWidth * 0.03,
                        ),
                        enabledBorder: Textformfiledfunction.enableborder(),
                        focusedBorder: Textformfiledfunction.focusedBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap:
                        () => Appnavigotor.push(context, NotificationsScreen()),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Appnavigotor.push(context, NotificationsScreen());
                          },
                          icon: Icon(
                            Icons.notifications_outlined,
                            size: 30,
                            color: Appcolors.notfcaitonred,
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Appcolors.notfcaitonred,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: BoldText(
                                text: "2",
                                fontsize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.local_offer_outlined,
                      size: 26,
                      color: Appcolors.oragneg,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              SemiBold(
                overflow: TextOverflow.ellipsis,
                text: "What would you like to do today?",
                fontsize: screenWidth < 350 ? 18 : 18,
              ),
              SizedBox(height: screenHeight * 0.015),
              // 🔥 Home Categories Grid
              GridView.builder(
                primary: false,
                physics: NeverScrollableScrollPhysics(),
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
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SemiBold(
                    text: "More",
                    fontsize: 14,
                    color: Appcolors.appgreen,
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Appcolors.appgreen,
                    size: 24,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              SemiBold(text: "Top picks for you", fontsize: 20),
              SizedBox(height: screenHeight * 0.01),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Appimages.discountimage1,
                  width: double.infinity,
                  height: screenHeight * 0.2,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SemiBold(
                      overflow: TextOverflow.ellipsis,
                      text: "Trending",
                      fontsize: screenWidth < 350 ? 18 : 22,
                    ),
                  ),
                  MediumFont(
                    text: "See all",
                    fontsize: screenWidth < 350 ? 14 : 16,
                    color: Appcolors.appgreen,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              SizedBox(
                height: screenHeight * 0.28,
                child: GridView.builder(
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
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Craze deals",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: screenHeight * 0.01),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Image.asset("assets/Group 111.png");
                },
              ),
              SizedBox(height: screenHeight * 0.015),
              Referandearncontanier(),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SemiBold(
                    text: "Nearby stores",
                    fontsize: screenWidth < 350 ? 18 : 22,
                  ),
                  MediumFont(
                    text: "See all",
                    fontsize: screenWidth < 350 ? 14 : 16,
                    color: Appcolors.appgreen,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: DummyData.nearbystoreslistitems.length,
                itemBuilder: (context, index) {
                  final item = DummyData.nearbystoreslistitems[index];
                  return NearbyStoresWidget(
                    image: item.image,
                    title: item.title,
                    subtitle: item.subtile,
                    minutes: item.minutes,
                    rating: item.rating,
                    siteno: item.siteno,
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: ButtonCircularRounded(
                  circluarradius: 0,
                  backgroundcolor: Appcolors.appgreen,
                  child: CustomFont(
                    text: "View all stores",
                    fontsize: 16,
                    color: Appcolors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
