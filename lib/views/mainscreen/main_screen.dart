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

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    OrderScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            body: pages[state.selectedindex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: state.selectedindex,
                onTap: (value) {
                  context.read<BottomNavBloc>().add(ChangeTabEvent(value));
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: Appcolors.white,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
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
