import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_ubah/app/screens/profile/edit_profile.dart';
import 'package:tugas_ubah/app/screens/auth/logins.dart';

import '../../constrant/constant.dart';
import '../../cubits/cubit/login_cubit.dart';
import '../../models/user_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(96, 216, 216, 216),
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius / 7,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 218, 217, 217),
                              radius: 30),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                jsonDecode(dataUser)['name'] ?? "null",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                jsonDecode(dataUser)['phone'] ?? "null",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius / 7,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileView(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      children: [
                        Icon(
                          IconlyBold.edit,
                          color: Colors.blue[300],
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Edit Profil",
                          style: TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_right_outlined)
                      ],
                    ),
                  ),
                  style: TextButton.styleFrom(primary: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                // height: 55,
                // width: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius / 7,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      children: [
                        Icon(
                          IconlyBold.setting,
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
                    ),
                  ),
                  style: TextButton.styleFrom(primary: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                // height: 55,
                // width: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius / 7,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double containerWidth = constraints.maxWidth;

                        return Row(
                          children: [
                            Icon(
                              IconlyBold.call,
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
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                // height: 55,
                // width: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius / 7,
                ),
                child: TextButton(
                  onPressed: () {
                    context.read<LoginCubit>().logout();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double containerWidth = constraints.maxWidth;

                        return Row(
                          children: [
                            Icon(
                              IconlyBold.logout,
                              color: Colors.blue[300],
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Keluar",
                              style: TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        );
                      },
                    ),
                  ),
                  style: TextButton.styleFrom(primary: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
