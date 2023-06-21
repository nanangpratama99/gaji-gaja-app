import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tugas_ubah/app/screens/loan/loan_view.dart';

import 'home/home_page.dart';
import 'profile/profile_page.dart';
import '../pages/page_tiga.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    // Add your pages here
    const HomeScreen(),
    const LoanView(),
    const PageTiga(),
    const ProfileScreen(),
  ];

  // list menu button
  List<String> menuItems = [
    "Home",
    "Loan",
    "Salary",
    "Person",
  ];
  List<IconData> iconItems = [
    IconlyLight.home,
    IconlyLight.activity,
    IconlyLight.wallet,
    IconlyLight.addUser,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF014DAC),
          // color: Colors.white,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), // adjust to your liking
            topRight: Radius.circular(40.0), // adjust to your liking
          ),
          // color: Color(0xFF06306F), // put the color here
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF014DAC),
            borderRadius: BorderRadius.circular(20),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            selectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  iconItems[0],
                  size: 30,
                  color: Colors.white,
                ),
                label: menuItems[0],
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  iconItems[1],
                  size: 30,
                  color: Colors.white,
                ),
                label: menuItems[1],
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  iconItems[2],
                  size: 30,
                  color: Colors.white,
                ),
                label: menuItems[2],
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  iconItems[3],
                  size: 30,
                  color: Colors.white,
                ),
                label: menuItems[3],
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
