import 'package:bording_week1/common/const/appcolors.dart';
import 'package:bording_week1/common/const/appimages.dart';
import 'package:bording_week1/common/const/constfunctions/text_formfiled_function.dart';
import 'package:bording_week1/common/const/styles/buttons/button_circular_rounded.dart';
import 'package:bording_week1/common/const/styles/texts/custom_font.dart';
import 'package:bording_week1/common/const/styles/texts/medium_font.dart';
import 'package:bording_week1/common/const/styles/texts/semibold.dart';
import 'package:bording_week1/common/girds/service_gird.dart';
import 'package:bording_week1/common/girds/trending_gird.dart';
import 'package:bording_week1/common/widgets/home_screen_appbar.dart';
import 'package:bording_week1/common/widgets/nearby_stores_widget.dart';
import 'package:bording_week1/common/widgets/notifcation_count_contianer.dart';
import 'package:bording_week1/common/widgets/referandearn_conantier.dart';
import 'package:bording_week1/dummy/dummy_data.dart';
import 'package:bording_week1/common/utils/navgtor.dart';
import 'package:flutter/material.dart';

/// HomeScreen widget displays the main home page of the app
/// including search bar, categories, trending items, deals,
/// nearby stores and other key sections.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive UI
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Custom AppBar for Home Screen
      appBar: HomeScreenappabr(),

      // Main content of the screen with padding
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.015,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔥 Search Bar + Notification Icon + Offer Icon Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Search TextField
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

                  // Notification Icon with Badge
                  InkWell(
                    onTap:
                        () => Appnavigotor.pushnamed(context, "/notifications"),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Appnavigotor.pushnamed(context, "/notifications");
                          },
                          icon: Icon(
                            Icons.notifications_outlined,
                            size: 30,
                            color: Appcolors.notfcaitonred,
                          ),
                        ),
                        // Notification count badge
                        Positioned(
                          right: 8,
                          top: 8,
                          child: NotifcationCountContianer(count: "2"),
                        ),
                      ],
                    ),
                  ),

                  // Offer Icon
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

              // Section title
              SemiBold(
                overflow: TextOverflow.ellipsis,
                text: "What would you like to do today?",
                fontsize: 18,
              ),

              SizedBox(height: screenHeight * 0.015),

              // 🔥 Home Categories Grid
              ServiceGrid(screenWidth: screenWidth),

              SizedBox(height: screenHeight * 0.015),

              // More categories indicator
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

              // Top picks section
              SemiBold(text: "Top picks for you", fontsize: 20),
              SizedBox(height: screenHeight * 0.01),

              // Promotional banner image
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

              // Trending section title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SemiBold(
                      overflow: TextOverflow.ellipsis,
                      text: "Trending",
                      fontsize: 22,
                    ),
                  ),
                  MediumFont(
                    text: "See all",
                    fontsize: 16,
                    color: Appcolors.appgreen,
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.015),

              // Trending items horizontal grid
              SizedBox(
                height: screenHeight * 0.28,
                child: TrendingGird(screenWidth: screenWidth),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Craze deals section
              Text(
                "Craze deals",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: screenHeight * 0.01),
              Image.asset("assets/Group 111.png"),

              SizedBox(height: screenHeight * 0.015),

              // Refer and Earn promotion container
              Referandearncontanier(),

              SizedBox(height: screenHeight * 0.02),

              // Nearby stores section title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SemiBold(text: "Nearby stores", fontsize: 22),
                  MediumFont(
                    text: "See all",
                    fontsize: 16,
                    color: Appcolors.appgreen,
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.015),

              // Nearby stores list
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

              // Button to view all stores
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
