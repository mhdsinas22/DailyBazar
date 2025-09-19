import 'package:flutter/material.dart';

class Appnavigotor {
  static push(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
      ),
    );
  }

  static pushnamed(BuildContext context, String named) {
    Navigator.pushNamed(context, named);
  }
}
