import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

import 'package:http/http.dart' as http;

import '../constrant/constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  // controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  // show / hide password
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNodeConfirm = FocusNode();

  bool _isVisiblePassword = false;
  bool _isVisibleConfirm = false;

  @override
  void _toggleVisible(int index) {
    setState(() {
      if (index == 0) {
        _isVisiblePassword = !_isVisiblePassword;
        if (textFieldFocusNode.hasFocus) {
          textFieldFocusNode.unfocus();
        }
      } else if (index == 1) {
        _isVisibleConfirm = !_isVisibleConfirm;
        if (textFieldFocusNodeConfirm.hasFocus) {
          textFieldFocusNodeConfirm.unfocus();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            const Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Image(
                image: AssetImage("assets/bg-splash.png"),
                fit: BoxFit.fitWidth,
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
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // LOGO
                          // const Text(
                          //   "REGISTER",
                          //   style: TextStyle(
                          //       fontSize: 30,
                          //       color: Color.fromARGB(255, 82, 82, 82)),
                          // ),
                          Image(
                            image: AssetImage("assets/logo.png"),
                            fit: BoxFit.fitWidth,
                            height: 150,
                          ),

                          sizedBoxH25,
                          // FORM INPUT
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              if (!EmailValidator.validate(value)) {
                                return 'Please Enter Right Email';
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                hintText: " Email",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.grey),
                                prefixIcon: Icon(
                                  IconlyBold.message,
                                  color: Colors.grey,
                                )),
                          ),
                          sizedBoxH25,
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null; // Return null if the validation is successful
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _isVisiblePassword,
                            focusNode: textFieldFocusNode,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Password',
                              labelStyle:
                                  GoogleFonts.poppins(color: Colors.grey),
                              filled: true,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              hintText: " Password",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 16, color: Colors.grey),
                              prefixIcon: Icon(
                                Icons.lock_rounded,
                                size: 24,
                                color: Colors.grey,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: GestureDetector(
                                  onTap: () => _toggleVisible(0),
                                  child: Icon(
                                    !_isVisiblePassword
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    size: 24,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          sizedBoxH25,
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _isVisibleConfirm,
                            focusNode: textFieldFocusNodeConfirm,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              // labelText: 'Cofirm Password',
                              filled: true,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              hintText: " Confirm Password",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 16, color: Colors.grey),
                              prefixIcon: Icon(
                                Icons.lock_rounded,
                                size: 24,
                                color: Colors.grey,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: GestureDetector(
                                  onTap: () => _toggleVisible(1),
                                  child: Icon(
                                    !_isVisibleConfirm
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    size: 24,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            controller: _confirmPassController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please repeat your password';
                              } else if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null; // Return null if the validation is successful
                            },
                          ),

                          sizedBoxH40,
                          // SIGN IN BUTTON
                          // ------------------
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_passwordController ==
                                      _confirmPassController) {
                                    postData(
                                      {
                                        "email": _emailController.text,
                                        "password": _passwordController.text,
                                      },
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Silahkan Login')),
                                    );
                                  }
                                }
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
                                'Sign Up',
                                style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          sizedBoxH20,
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Text(
                                  "Already have an account",
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 82, 82, 82)),
                                ),
                                const Spacer(),
                                Text(
                                  "Login Now",
                                  style: GoogleFonts.poppins(
                                      color: Color.fromARGB(255, 82, 82, 82),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Color.fromARGB(255, 82, 82, 82),
                                    size: 23,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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

Future<http.Response> postData(Map<String, String> data) async {
  final response =
      await http.post(Uri.parse("http://$localAddress:8081/register"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
  statuscode = response.statusCode;
  print(statuscode);
  print(response.body);
  return response;
}

int statuscode = 0;
