import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_ubah/app/constrant/constant.dart';
import 'package:tugas_ubah/app/screens/auth/logins_screen.dart';
import 'package:tugas_ubah/app/screens/auth/register.dart';

import 'login_pin_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
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
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40.0), // Set the top border radius
              ),
            ),
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0), // Set the top border radius
                  ),
                ),
                child: Column(
                  children: [
                    // using pin
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPinScreen())),
                      child: Container(
                        margin: EdgeInsets.only(top: 50, left: 40, right: 40),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Using PIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    // using password
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      child: Container(
                        margin: EdgeInsets.only(top: 40, left: 40, right: 40),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Using Password",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
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
      height: 55,
      child: ElevatedButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterScreen())),
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
