import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tugas_ubah/app/constrant/constant.dart';

import '../auth/logins.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
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
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            jsonDecode(dataUser)['name'] ?? "null",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                      const Icon(
                        IconlyLight.notification,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // content
            Positioned(
              top: 170,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: const Offset(5, 10),
                      )
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // cards
                      _cards(context),
                      _detailCard(context),
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
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    // margin: EdgeInsets.only(top: 20),
    // width: MediaQuery.of(context).size.width / 1.1,
    height: MediaQuery.of(context).size.height / 3.4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.8,
          padding: EdgeInsets.all(5),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Analityc",
                  style: TextStyle(
                      color: Colors.white38, fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Rp. 3000.000",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Company",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("Gpay", style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(35, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(35, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _detailCard(context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Detail Saldo",
          style: TextStyle(fontSize: 20),
        ),
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Color.fromARGB(255, 200, 200, 200),
            ),
          ),
          child: Icon(
            IconlyLight.arrowRight,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
