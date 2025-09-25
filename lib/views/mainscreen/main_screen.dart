import 'package:bording_week1/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:bording_week1/bloc/bottom_nav/bottom_nav_event.dart';
import 'package:bording_week1/bloc/bottom_nav/bottom_nav_state.dart';
import 'package:bording_week1/common/const/appcolors.dart';
import 'package:bording_week1/common/const/appicons.dart';
import 'package:bording_week1/views/otherscreen/account_screen.dart';
import 'package:bording_week1/views/otherscreen/cart_screen.dart';
import 'package:bording_week1/views/otherscreen/home_screen.dart';
import 'package:bording_week1/views/otherscreen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// MainScreen is the root screen of the app with Bottom Navigation
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // List of pages for BottomNavigationBar
  final List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    OrderScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide BottomNavBloc to manage BottomNavigation state
      create: (context) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            // Display the selected page based on the current state
            body: pages[state.selectedindex],

            // Bottom Navigation Bar
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  // Subtle shadow above the BottomNavigationBar
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: state.selectedindex, // Highlight current tab
                onTap: (index) {
                  // Dispatch event to change tab
                  context.read<BottomNavBloc>().add(ChangeTabEvent(index));
                },
                type: BottomNavigationBarType.fixed, // Fixed tabs
                backgroundColor: Appcolors.white,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
                  // Home tab
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Appicons.homeicon,
                      color:
                          state.selectedindex == 0
                              ? Appcolors.appgreen
                              : Appcolors.darkshade,
                    ),
                    label: "Home",
                  ),

                  // Cart tab
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Appicons.carticon,
                      color:
                          state.selectedindex == 1
                              ? Appcolors.appgreen
                              : Appcolors.darkshade,
                    ),
                    label: "Cart",
                  ),

                  // My Order tab
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Appicons.bagicon,
                      color:
                          state.selectedindex == 2
                              ? Appcolors.appgreen
                              : Appcolors.darkshade,
                    ),
                    label: "My Order",
                  ),

                  // Account tab
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Appicons.profileicon,
                      color:
                          state.selectedindex == 3
                              ? Appcolors.appgreen
                              : Appcolors.darkshade,
                    ),
                    label: "Account",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
