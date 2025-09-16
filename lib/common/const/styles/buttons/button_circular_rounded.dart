import 'package:flutter/material.dart';

class ButtonCircularRounded extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundcolor;
  final bool needborder;
  final double circluarradius;
  const ButtonCircularRounded({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundcolor = Colors.transparent,
    this.needborder = false,
    this.circluarradius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 40,
      decoration:
          needborder
              ? BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 2),
              )
              : BoxDecoration(
                borderRadius: BorderRadius.circular(circluarradius),
              ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: child,
      ),
    );
  }
}
