import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constrant/constant.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  // show hide password
  bool _obscureText = true;
  bool _obscureText2 = true;

  // ===
  Map<String, String> data = {
    'title': 'Reset',
    'title2': 'Password',
    'description':
        'dont worry, please enter new password for reset your password',
    'subTitle': 'Cahange Pssword',
  };

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
                        top: 250, left: 20, right: 20, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['title']!,
                          style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        Text(
                          data['title2']!,
                          style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        sizedBoxH10,
                        Text(
                          data['description']!,
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        ),
                        sizedBoxH30,
                        Form(
                          child: Column(
                            children: [
                              // LOGO

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['subTitle']!,
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 20),
                                  ),
                                ],
                              ),
                              sizedBoxH10,
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter new password';
                                  }
                                  return null;
                                },
                                obscureText: _obscureText,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(
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
                                  prefixIcon: const Icon(
                                    IconlyBold.password,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              sizedBoxH20,
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter new password';
                                  }
                                  return null;
                                },
                                obscureText: _obscureText2,
                                style: const TextStyle(
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
                                  prefixIcon: const Icon(
                                    IconlyBold.password,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText2
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText2 = !_obscureText2;
                                      });
                                    },
                                  ),
                                ),
                              ),

                              sizedBoxH40,
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
}
