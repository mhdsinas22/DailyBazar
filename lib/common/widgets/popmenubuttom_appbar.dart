import 'package:flutter/material.dart';

class PopmenubuttomAppbar extends StatelessWidget {
  const PopmenubuttomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.keyboard_arrow_down),
      itemBuilder: (context) {
        return [PopupMenuItem(child: Text("data"))];
      },
    );
  }
}
