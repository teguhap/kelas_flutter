// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mulai_flutter_2/views/home/home.dart';
import 'package:mulai_flutter_2/views/home/widgets/custom_item.dart';
import 'package:mulai_flutter_2/views/home/widgets/item.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Default',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                height: 200,
                width: 50,
              ),
              CustomItem(
                radius: 50,
                color: Colors.blue,
              ),
              Item(),
              Item(),
              Item(),
            ],
          ),
        ),
      ],
    );
  }
}
