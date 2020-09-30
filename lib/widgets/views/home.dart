///
//
/// @About:     
// @File:       home.dart 
// @Date:       09-29-20
// @Version:    popular_cities 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popular_cities/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:popular_cities/widgets/utils/colors.dart';
import 'package:popular_cities/widgets/views/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  final List<Widget> _children = [
    new HomePage(),
  ];
  void onChangeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomePageBloc, HomePageState>(
        listener: (context, state)
        {

        },
        child: _children[selectedIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        onTap: onChangeTab,
        backgroundColor: Colors.grey.withOpacity(0.5),
        index: 0,
        items: [
          Icon(FontAwesomeIcons.safari),
        ],
      )
    );
  }

}
