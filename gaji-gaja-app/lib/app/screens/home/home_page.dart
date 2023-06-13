import 'dart:convert';
import 'dart:io';
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
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            jsonDecode(dataUser)['name'] ?? "null",
                            style: TextStyle(color: Colors.white, fontSize: 25),
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: const BorderRadius.only(
                //       topLeft: Radius.circular(30),
                //       topRight: Radius.circular(30),
                //     ),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.shade600,
                //         spreadRadius: 1,
                //         blurRadius: 20,
                //         offset: const Offset(5, 10),
                //       )
                //     ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _listMenu(),
                      _mainCard(context),
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
    // margin: EdgeInsets.only(top: 20),
    // width: MediaQuery.of(context).size.width / 1.1,
    height: MediaQuery.of(context).size.height / 3.4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _mainCard(context),
      ],
    ),
  );
}

Widget _mainCard(context) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    width: MediaQuery.of(context).size.width / 1.1,
    padding: EdgeInsets.all(5),
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
                "Analityc",
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
          const Text(
            "Rp. 3.000.000",
            style: TextStyle(
                color: Colors.white, fontSize: 33, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Selengkapnya",
                style: TextStyle(color: Colors.white, letterSpacing: 1),
              ),
              Container(
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
  );
}

Widget _listMenu() {
  List<String> itemsMenu = [
    "Item1",
    "Item2",
    "Item3",
    "Item4",
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
            child: Center(
              child: Text(
                itemsMenu[index],
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
        );
      },
    ),
  );
}
