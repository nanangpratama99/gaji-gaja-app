import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../color/constant.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: 0,
              left: 0,
              child: Image.asset(
                "asset/image/resetpass.png",
                width: 200,
                height: 200,
              ),
            ),
            // FORM LOGIN
            // --------------

            Center(
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  // height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 250, left: 30, right: 30, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reset",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "dont worry, please enter new password for reset your password",
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Form(
                          child: Column(
                            children: [
                              // LOGO

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Change Password",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 45, 45, 45)),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: " Enter your new password",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.grey),
                                  prefixIcon: Icon(
                                    IconlyBold.password,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 45, 45, 45)),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: " Confirm your password",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.grey),
                                  prefixIcon: Icon(
                                    IconlyBold.password,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 40,
                              ),
                              // SIGN IN BUTTON
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResetPage(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Radius sudut tombol
                                    ),
                                    primary:
                                        primaryColor, // Warna latar belakang tombol
                                  ),
                                  child: Text(
                                    'Save',
                                    style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.arrow_back,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "Back",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
