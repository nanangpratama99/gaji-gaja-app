import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_ubah/app/screens/auth/login_pin.dart';
import 'package:tugas_ubah/app/screens/profile/change_pin.dart';
import 'package:tugas_ubah/app/screens/profile/edit_profile.dart';
import 'package:tugas_ubah/app/screens/backap/logins_screen.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                name.toString().toUpperCase(),
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              // child: Text(
                              //   jsonDecode(dataUser)['phone'] ?? "null",
                              //   style:
                              //       TextStyle(fontSize: 12, color: Colors.grey),
                              // ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              sizedBoxH30,
              ListProfile(
                icon: IconlyBold.edit,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileView(),
                    ),
                  );
                },
                text: 'Edit Profile',
              ),
              sizedBoxH10,
              ListProfile(
                icon: IconlyBold.lock,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePinScreen(),
                    ),
                  );
                },
                text: 'Change Pin',
              ),
              sizedBoxH10,
              ListProfile(
                icon: IconlyBold.setting,
                onPress: () {},
                text: 'Pengaturan Aplikasi',
              ),
              sizedBoxH10,
              ListProfile(
                icon: IconlyBold.call,
                onPress: () {},
                text: 'Pusat Bantuan',
              ),
              sizedBoxH10,
              ListProfile(
                icon: IconlyBold.logout,
                onPress: () {
                  context.read<LoginCubit>().logout(1);
                },
                text: 'Keluar',
              ),
              sizedBoxH10,
            ],
          ),
        ),
      ),
    );
  }
}

class ListProfile extends StatelessWidget {
  const ListProfile(
      {Key? key, required this.onPress, required this.icon, required this.text})
      : super(key: key);

  final VoidCallback onPress;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius / 7,
      ),
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(primary: Colors.black),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blue[300],
              ),
              sizedBoxH10,
              Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
