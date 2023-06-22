import 'dart:async';
import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tugas_ubah/app/screens/auth/login_password.dart';
import 'package:tugas_ubah/app/screens/profile/change_pin.dart';

import '../../constrant/constant.dart';
import '../../cubits/cubit/login_cubit.dart';

class PayLoanView extends StatefulWidget {
  const PayLoanView({super.key});

  @override
  State<PayLoanView> createState() => _PayLoanViewState();
}

class _PayLoanViewState extends State<PayLoanView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Pay Loan",
          style: TextStyle(
              fontSize: 30, color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        Container(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            // height: 450,
            decoration: BoxDecoration(
              color: Colors.white60.withBlue(255),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // LOGO

                    sizedBoxH20,
                    // FORM INPUT
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 45, 45, 45)),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        label: Text("Nominal Loan"),
                        hintText: " Masukkan Nominal",
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.monetization_on,
                          color: Colors.grey,
                          size: 40,
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                    sizedBoxH20,

                    // SIGN IN BUTTON
                    // ------------------
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Radius sudut tombol
                          ),
                          primary: Colors.green, // Warna latar belakang tombol
                        ),
                        onPressed: () async {},
                        child: Text(
                          'Pay Now',
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    sizedBoxH40,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // widget
  Widget _reqNominal() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        "Rp.100",
        style: TextStyle(fontSize: 15, color: Colors.black54),
      ),
    );
  }
}
