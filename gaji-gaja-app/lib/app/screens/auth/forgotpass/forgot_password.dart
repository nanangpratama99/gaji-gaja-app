import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_ubah/app/screens/auth/forgotpass/reset_page.dart';

import '../../../constrant/constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  get primaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 0,
              left: 0,
              child: Image.asset(
                "asset/image/forgot_password.png",
                width: 250,
                height: 250,
              ),
            ),
            // FORM LOGIN
            // --------------
            Center(
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  // height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 250, left: 20, right: 20, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _title("Forgot"),
                        _title("PIN"),
                        sizedBoxH10,
                        _subTitle(
                            "dont worry, please enter Company Email for reset your PIN"),
                        sizedBoxH30,
                        Form(
                          child: Column(
                            children: [
                              _pinTextField("Email Company", IconlyBold.message,
                                  IconlyLight.arrowRight),
                              sizedBoxH20,
                              _title2(),
                              sizedBoxH10,
                              _otpTextField("Enter OTP", IconlyBold.lock),
                              sizedBoxH40,
                              // OTP BUTTON
                              _buttonOtp(context),
                              sizedBoxH20,
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
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

  // widget

  // title widget
  Widget _title(String textTitle) {
    return Text(
      textTitle,
      style: const TextStyle(
          fontSize: 35, fontWeight: FontWeight.w600, color: Colors.black54),
    );
  }

  // subtitle widget
  Widget _subTitle(String subText) {
    return Text(
      subText,
      style: TextStyle(fontSize: 12, color: Colors.black45),
    );
  }

  // pin textfield widget
  Widget _pinTextField(String hint, IconData icon, IconData icon2) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            style: const TextStyle(color: Color.fromARGB(255, 45, 45, 45)),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: hint,
              hintStyle: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              primary: Color(0xFF014DAC),
            ),
            child: Icon(
              icon2,
              size: 30,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

// otp title
  Widget _title2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Enter your OTP Code",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  // otp textfield widget
  Widget _otpTextField(String hint, IconData icon) {
    return TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 45, 45, 45)),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
    );
  }

  // button otp widget
  Widget _buttonOtp(context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ResetPage()));
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Radius sudut tombol
          ),
          primary: Color(0xFF014DAC), // Warna latar belakang tombol
        ),
        child: Text(
          'Verify OTP',
          style: GoogleFonts.poppins(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
