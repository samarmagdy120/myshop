import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myshop/shared/styles/icon_broken.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
bottomNavigationBar: CurvedNavigationBar(
  backgroundColor: Colors.deepOrange,
  items: <Widget>[
    Icon(IconBroken.Home),
    Icon(IconBroken.Category),
    Icon(IconBroken.Heart),
    Icon(IconBroken.Setting),

  ],
  onTap: (index) {
    //Handle button tap
  },
),
      body:Column(
        children: [],
      )
    );
  }
}
