import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  final int splashDuration;
  final Widget navigateAfterSplash;

  SplashScreen(
      {super.key,
      this.splashDuration = 3000,
      required this.navigateAfterSplash});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: widget.splashDuration),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => widget.navigateAfterSplash,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: 50,
              left: 50,
              bottom: 50,
              child: Image.asset(
                'asset/image/logo.png',
                fit: BoxFit.fitWidth,
                width: 10,
                height: 10,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                'asset/image/bg-splash.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              // top: 0,
              right: 0,
              left: 0,
              bottom: 15,
              child: Center(
                child: Text(
                  'Ver.2.1.3',
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
