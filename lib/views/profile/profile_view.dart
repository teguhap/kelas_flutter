import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  String nama = "Teguh";

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

          title: Text('Profile View'),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/setting',
                      (route) {
                        return route.settings.name == '/home';
                      },
                    );
                  },
                  child: Text('Setting')),
            ),
          ),
        ));
  }
}
