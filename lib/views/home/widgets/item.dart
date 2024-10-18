import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Icon(
              Icons.image_outlined,
              size: 50,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Switzerland',
                style: TextStyle(),
              ),
              Icon(
                Icons.live_help_rounded,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star_border,
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                '4.5',
              ),
            ],
          )
        ],
      ),
    );
  }
}
