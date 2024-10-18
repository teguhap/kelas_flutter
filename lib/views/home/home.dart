import 'package:flutter/material.dart';
import 'package:mulai_flutter_2/views/home/views/category_view.dart';
import 'package:mulai_flutter_2/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  String? nama;

  HomeView({super.key, this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
            ),
          ),

          title: Text('Home View'),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Center(
            child: Container(child: Text(nama ?? 'Hallo')),
          ),
        ));
  }
}
