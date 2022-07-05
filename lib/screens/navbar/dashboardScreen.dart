import 'package:drohealth/screens/navbar/pharmacyScreen.dart';
import 'package:drohealth/screens/navbar/profileScreen.dart';
import 'package:flutter/material.dart';

import 'communityScreen.dart';
import 'doctorScreen.dart';
import 'homescreen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 2;

  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    DoctorScreen(),
    PharmacyScreen(),
    CommunityScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xff9F5DE2),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedItemColor: Color(0xff828282),
        backgroundColor: Color(0xEEEBF1CC),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Doctors'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),label: 'Pharmacy' ),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Community'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
      ],
      ),
    );
  }
}
