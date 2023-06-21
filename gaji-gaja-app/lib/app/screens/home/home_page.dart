import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_ubah/app/constrant/constant.dart';
import 'package:tugas_ubah/app/screens/auth/login_pin.dart';
import 'package:tugas_ubah/app/screens/loan/loan_screens.dart';
import 'package:tugas_ubah/app/screens/loan/loan_view.dart';

import '../backap/logins_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "asset/image/background-rotate.png",
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width * 2,
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Halo,",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(
                                255,
                                187,
                                187,
                                187,
                              ),
                            ),
                          ),
                          sizedBoxH3,
                          Text(
                            name.toString().toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => exit(0),
                        icon: const Icon(
                          IconlyLight.notification,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            // content
            Positioned(
              top: 170,
              bottom: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _listMenu(),
                      _salaryCard(context),
                      _loanCard(context),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _cards(context) {
  return Container(
    height: MediaQuery.of(context).size.height / 3.4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _salaryCard(context),
      ],
    ),
  );
}

Widget _salaryCard(context) {
  return Container(
    margin: EdgeInsets.only(top: 20, bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SALARY",
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width / 1.1,
          padding: EdgeInsets.all(0),
          height: 250,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Available Salary",
                      style: TextStyle(
                          color: Colors.white38, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        "asset/image/logo-white.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Rp. 3.000.000",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "For this month",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Selengkapnya",
                      style: TextStyle(color: Colors.white, letterSpacing: 1),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.20),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(
                        IconlyLight.arrowRight,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// loan card
Widget _loanCard(context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Loan",
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.orange[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.payments_rounded,
                    color: Colors.white60,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "2.500.000",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoanScreen(),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

// list menu
Widget _listMenu() {
  List<String> itemsMenu = [
    "15 Days Worked",
    "Item2",
    "Item3",
    "Item4",
  ];
  List<IconData> iconMenu = [
    Icons.date_range,
    Icons.abc,
    Icons.abc,
    Icons.abc,
  ];

  return Container(
    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
    height: 70,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemsMenu.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    iconMenu[index],
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // child: VerticalDivider(
                  //   thickness: 2,
                  // ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      itemsMenu[index],
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    itemsMenu[index] == '15 Days Worked'
                        ? Container(
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(3),
                            child: Text(
                              "This Month",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        : Container()
                  ],
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
