import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  double radius;
  Color color;
  CustomItem({super.key, required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}
