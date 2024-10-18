import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
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

          title: Text('Setting View'),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) {
                        return route.settings.name == '/login';
                      },
                    );
                  },
                  child: Text('Logout')),
            ),
          ),
        ));
  }
}
