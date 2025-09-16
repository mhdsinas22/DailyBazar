import 'package:bording_week1/common/const/styles/texts/semibold.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: SemiBold(text: "Account")));
  }
}
