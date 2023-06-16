import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_ubah/app/constrant/constant.dart';
import 'package:tugas_ubah/app/screens/backap/logins_screen.dart';
import 'package:tugas_ubah/app/screens/auth/register.dart';

import 'login_pin.dart';
import '../backap/login_pin_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
              Image.asset(
                "asset/image/welcome.png",
                fit: BoxFit.fitWidth,
              ),
              sizedBoxH10,
              _loginButton(context),
              _regisButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // widgets

  //  logins button widget
  Widget _loginButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40.0), // Set the top border radius
              ),
            ),
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0), // Set the top border radius
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 40),
                      height: 7,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),

                    // LOGIN FORM USIGN PIN
                    const LoginScreenUsingPin(),
                  ],
                ),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Radius sudut tombol
          ),
          primary: primaryColor, // Warna latar belakang tombol
        ),
        child: Text(
          'Sign In',
          style: GoogleFonts.poppins(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _regisButton(context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 0.9),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterScreen(),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            // Radius sudut tombol
          ),
        ),
        child: Text(
          'Sign Up',
          style: GoogleFonts.poppins(
              fontSize: 17, color: primaryColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
