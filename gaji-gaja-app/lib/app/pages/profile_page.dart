import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../cubits/cubit/login_cubit.dart';

class PageEmpat extends StatefulWidget {
  const PageEmpat({super.key});

  @override
  State<PageEmpat> createState() => _PageEmpatState();
}

class _PageEmpatState extends State<PageEmpat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 216, 216, 216),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5,
                      offset: Offset(0, 5))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 218, 217, 217),
                            radius: 30),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 20),
                            child: Text('Ini Nama Kamu',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              '+62814848484848',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 5),
                          //   child: Text(
                          //     '300 Point',
                          //     style: TextStyle(fontSize: 10),
                          //   ),
                          // ),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          // Mendapatkan lebar Container saat ini
                          double containerWidth = constraints.maxWidth;

                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 30,
                            // width: containerWidth > 350 ? 350 : containerWidth, // Batasi lebar maksimum Container menjadi 350
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 4, 76, 135),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Lihat Profil Saya",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style:
                                    TextButton.styleFrom(primary: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              // height: 55,
              // width: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double containerWidth = constraints.maxWidth;

                      return Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.blue[300],
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Edit Profil",
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right_outlined)
                        ],
                      );
                    },
                  ),
                ),
                style: TextButton.styleFrom(primary: Colors.black),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              // height: 55,
              // width: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double containerWidth = constraints.maxWidth;

                      return Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.blue[300],
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Pengaturan Aplikasi",
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right_outlined)
                        ],
                      );
                    },
                  ),
                ),
                style: TextButton.styleFrom(primary: Colors.black),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              // height: 55,
              // width: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double containerWidth = constraints.maxWidth;

                      return Row(
                        children: [
                          Icon(
                            Icons.local_phone,
                            color: Colors.blue[300],
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Pusat Bantuan",
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right_outlined)
                        ],
                      );
                    },
                  ),
                ),
                style: TextButton.styleFrom(primary: Colors.black),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              // height: 55,
              // width: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {
                  context.read<LoginCubit>().logout();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double containerWidth = constraints.maxWidth;

                      return Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.blue[300],
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Keluar",
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right_outlined)
                        ],
                      );
                    },
                  ),
                ),
                style: TextButton.styleFrom(primary: Colors.black),
              ),
            ),
            SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
