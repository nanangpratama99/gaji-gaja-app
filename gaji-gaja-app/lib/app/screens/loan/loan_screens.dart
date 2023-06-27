import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_ubah/app/constrant/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tugas_ubah/app/screens/loan/pay_debt_form.dart';
import 'package:tugas_ubah/app/screens/loan/pay_loan_form.dart';
import 'package:tugas_ubah/app/screens/loan/req_loan_form.dart';
import 'package:tugas_ubah/app/screens/loan/tab_bar_loan.dart';

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
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Stack(
              children: [
                _tabBar(context),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Loan",
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    Text(
                      "Available loan",
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                    _loan(context),
                    // jumlah loan
                    // _outstandingLoan(context),
                  ],
                ),
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
        color: black1,
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
                fontSize: 40, fontWeight: FontWeight.w600, color: white),
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
                    primary: green, // Warna latar belakang tombol
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
                          height: MediaQuery.of(context).size.height / 1.5,
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
                              const ReqLoanView(),
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
                    primary: Colors.white54, // Warna latar belakang tombol
                  ),
                  onPressed: () async {},
                  child: Icon(
                    Icons.history_rounded,
                    color: Colors.white,
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

  // tabbar
  Widget _tabBar(context) {
    return Container(
      margin: EdgeInsets.only(top: 320),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.black.withOpacity(0.1),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: primaryColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey.shade900,
                tabs: const [
                  Tab(
                    text: "Out. Loan",
                  ),
                  Tab(
                    text: "Out. Debt",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Konten untuk tab "Out. Loan"
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          sizedBoxH20,
                          ListOut(
                            amount: "1.000.000",
                            btnText: "Pay Now",
                            color: blue,
                            date: "20/10/2023",
                            text: "Amount Loan",
                            onPress: () {
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
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                            20.0), // Set the top border radius
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 40),
                                          height: 7,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),

                                        // LOGIN FORM USIGN PIN
                                        const PayLoanView(),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          ListOut(
                            amount: "2.000.000",
                            btnText: "Pay Now",
                            color: blue,
                            date: "21/10/2023",
                            text: "Amount Loan",
                            onPress: () {
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
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                            20.0), // Set the top border radius
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 40),
                                          height: 7,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),

                                        // LOGIN FORM USIGN PIN
                                        const PayLoanView(),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          ListOut(
                            amount: "3.000.000",
                            btnText: "Pay Now",
                            color: blue,
                            date: "22/10/2023",
                            text: "Amount Loan",
                            onPress: () {
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
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                            20.0), // Set the top border radius
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 40),
                                          height: 7,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),

                                        // LOGIN FORM USIGN PIN
                                        const PayLoanView(),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Konten untuk tab "Out. Debt"
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          sizedBoxH20,
                          ListOut(
                            amount: "1.000.000",
                            btnText: "Repay Now",
                            color: orange,
                            date: "20/10/2023",
                            text: "Amount Debt",
                            onPress: () {
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
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                            20.0), // Set the top border radius
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 40),
                                          height: 7,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),

                                        // LOGIN FORM USIGN PIN
                                        const PayLoanView(),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          ListOut(
                            amount: "2.000.000",
                            btnText: "Repay Now",
                            color: orange,
                            date: "21/10/2023",
                            text: "Amount Debt",
                            onPress: () {
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
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                            20.0), // Set the top border radius
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 40),
                                          height: 7,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),

                                        // LOGIN FORM USIGN PIN
                                        const PayLoanView(),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          ListOut(
                            amount: "3.000.000",
                            btnText: "Repay Now",
                            color: orange,
                            date: "22/10/2023",
                            text: "Amount Debt",
                            onPress: () {
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
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                            20.0), // Set the top border radius
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 40),
                                          height: 7,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),

                                        // LOGIN FORM USIGN PIN
                                        const PayLoanView(),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListOut extends StatelessWidget {
  const ListOut(
      {Key? key,
      required this.onPress,
      required this.amount,
      required this.text,
      required this.btnText,
      required this.date,
      required this.color})
      : super(key: key);

  final VoidCallback onPress;
  final String text;
  final String amount;
  final String btnText;
  final String date;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
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
          sizedBoxH10,
          // button
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        Text(
                          'Rp. $amount',
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: black1,
                              fontWeight: FontWeight.w600),
                        ),
                        sizedBoxH10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.date_range_rounded,
                              color: Colors.grey,
                              size: 25,
                            ),
                            sizedBoxW10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "doe date",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 11),
                                    ),
                                    Text(
                                      date,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Container(
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(45), // Radius sudut tombol
                        ),
                        primary: color, // Warna latar belakang tombol
                      ),
                      onPressed: onPress,
                      child: Text(
                        btnText,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
