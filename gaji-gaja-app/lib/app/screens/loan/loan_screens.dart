import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_ubah/app/constrant/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tugas_ubah/app/screens/loan/loan_view.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Loan",
                  style:
                      GoogleFonts.poppins(fontSize: 30, color: Colors.black54),
                ),
                Text(
                  "Available loan",
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
                // jumlah loan
                _loan(context),
                _outstandingLoan(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // widget
  Widget _loan(context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "2.500.000",
            style: GoogleFonts.poppins(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
          Text(
            "Avalilable loan you can witdraw",
            style: GoogleFonts.poppins(color: Colors.grey),
          ),
          sizedBoxH10,
          // button
          Row(
            children: [
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(35), // Radius sudut tombol
                    ),
                    primary: Colors.green, // Warna latar belakang tombol
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                              40.0), // Set the top border radius
                        ),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                  20.0), // Set the top border radius
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
                              const LoanView(),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Request Loan',
                    style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(45), // Radius sudut tombol
                    ),
                    primary: Color.fromARGB(
                        255, 230, 230, 230), // Warna latar belakang tombol
                  ),
                  onPressed: () async {},
                  child: Icon(
                    Icons.history_rounded,
                    color: Colors.black45,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _outstandingLoan(context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Outstandi loan",
            style: GoogleFonts.poppins(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "The loan you need to pay soon",
            style: GoogleFonts.poppins(color: Colors.grey),
          ),
          sizedBoxH10,
          // button
          Row(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                dashPattern: [10, 10],
                color: Colors.grey,
                strokeWidth: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'Rp. 1000.000',
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(45), // Radius sudut tombol
                    ),
                    primary: Color.fromARGB(
                        255, 230, 230, 230), // Warna latar belakang tombol
                  ),
                  onPressed: () async {},
                  child: Icon(
                    Icons.history_rounded,
                    color: Colors.black45,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
