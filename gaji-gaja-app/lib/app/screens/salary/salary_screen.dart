import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_ubah/app/constrant/constant.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({super.key});

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                _title(),
                _salaryCard(context),
                _menu(),
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          _subtitle(),
                          _history(context),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // widgets
  Widget _title() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "My Wage",
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            Text(
              "Your Salary Here",
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  Widget _salaryCard(context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }

  Widget _menu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100,
          height: 100,
          color: blue,
        ),
        Container(
          width: 100,
          height: 100,
          color: blue,
        ),
        Container(
          width: 100,
          height: 100,
          color: blue,
        ),
      ],
    );
  }

  Widget _history(context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 265,
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
                      text: "In come",
                    ),
                    Tab(
                      text: "Out come",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Konten untuk tab "Out. Loan"
                    Container(
                      child: Flexible(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _income(),
                              _income(),
                              _income(),
                              _income(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Konten untuk tab "Out. Debt"
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            _outCome(),
                            _outCome(),
                            _outCome(),
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
      ),
    );
  }

  // subtitle
  Widget _subtitle() {
    return Text("History");
  }

  // income
  Widget _income() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: black1.withOpacity(0.1),
        border: Border(
          left: BorderSide(color: orange, width: 5),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.check,
              color: white,
              size: 20,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            "Rp. 30.000",
            style: GoogleFonts.poppins(
                color: black1, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          Spacer(),
          Icon(
            Icons.bookmark,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  // outcome
  Widget _outCome() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: black1.withOpacity(0.1),
        border: Border(
          left: BorderSide(color: orange, width: 5),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.check_box_outline_blank,
              color: white,
              size: 20,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            "Rp. 30.000",
            style: GoogleFonts.poppins(
                color: black1, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          Spacer(),
          Icon(
            Icons.bookmark,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
