import 'dart:async';
import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_ubah/app/screens/auth/login_password.dart';
import 'package:tugas_ubah/app/screens/profile/change_pin.dart';

import '../../constrant/constant.dart';
import '../../cubits/cubit/login_cubit.dart';
import 'forgotpass/forgot_password.dart';

// ignore: prefer_typing_uninitialized_variables
var dataUser;
String? name;

class LoginScreenUsingPin extends StatefulWidget {
  const LoginScreenUsingPin({super.key});

  @override
  State<LoginScreenUsingPin> createState() => _LoginScreenUsingPinState();
}

class _LoginScreenUsingPinState extends State<LoginScreenUsingPin> {
  // controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

// login func
  final _formKey = GlobalKey<FormState>();

// show / hide password
  final textFieldFocusNode = FocusNode();
  int code = 0;
  bool _isVisible = true;
  bool _isLoading = false;

  Future<http.Response> postData(Map<String, String> data) async {
    print(data);
    final response = await http.post(
      Uri.parse("http://$localAddress:8081/user/loginV2"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    final response2 = await http.post(
      Uri.parse("http://$localAddress:8081/user/findEmail"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    print("Response");
    print(response2.statusCode);

    code = response.statusCode;
    dataUser = response2.body;

    try {
      print(response2.body);
      print(jsonDecode(response2.body)['roleId']);
    } catch (e) {
      print(e);
    }
    if (jsonDecode(dataUser)['name'] == null) {
      name = "Null";
    } else {
      name = (jsonDecode(dataUser)['name']);
    }

    return response;
  }

  @override
  void _toggleVisible() {
    setState(
      () {
        _isVisible = !_isVisible;
        if (textFieldFocusNode.hasPrimaryFocus)
          return; // If focus is on text field, dont unfocus
        textFieldFocusNode.canRequestFocus =
            false; // Prevents focus if tap on eye
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Please Login",
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
                key: _formKey,
                child: Column(
                  children: [
                    // LOGO

                    sizedBoxH20,
                    // FORM INPUT
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Please Enter Right Username';
                        }

                        return null;
                      },
                      style: const TextStyle(
                          color: Color.fromARGB(255, 45, 45, 45)),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: " Username",
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.grey),
                        prefixIcon: const Icon(
                          IconlyBold.message,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    sizedBoxH25,
                    TextFormField(
                      controller: _pinController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your PIN';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isVisible,
                      focusNode: textFieldFocusNode,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 45, 45, 45)),
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: ' PIN',
                        filled: true,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: " Pin",
                        labelStyle: GoogleFonts.poppins(color: Colors.grey),
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                          size: 24,
                          color: Colors.grey,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: GestureDetector(
                            onTap: _toggleVisible,
                            child: Icon(
                              !_isVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                              size: 24,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxH10,
                    Row(
                      children: [
                        Radio(
                          activeColor: Color.fromARGB(255, 75, 75, 75),
                          value: 1,
                          groupValue: 1,
                          onChanged: (value) {},
                        ),
                        Text(
                          "Remember me",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color.fromARGB(255, 75, 75, 75)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                            "Forgot pin",
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Colors.orange),
                          ),
                        ),
                      ],
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            try {
                              Timer(Duration(seconds: 5), () {
                                print('Timer complete!');
                              });

                              // Show the circular progress indicator
                              // showDialog(
                              //   context: context,
                              //   barrierDismissible: false,
                              //   builder: (BuildContext context) {
                              //     return Center(
                              //       child: CircularProgressIndicator(),
                              //     );
                              //   },
                              // );

                              var response = await postData({
                                "email": _emailController.text,
                                "pin": _pinController.text,
                              });

                              // Hide the circular progress indicator
                              Navigator.pop(context);

                              print(response.statusCode);

                              if (response.statusCode == 404) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      'Email / Pin Salah',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              } else if (response.statusCode == 500) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      'User tidak ditemukan',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              } else {
                                if (jsonDecode(dataUser)['update'] == null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChangePinScreen(),
                                    ),
                                  );
                                } else {
                                  context.read<LoginCubit>().login(1);
                                  // Navigator.pop(context);
                                }
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    sizedBoxH40,
                    GestureDetector(
                      onTap: () => showModalBottomSheet(
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

                                // LOGIN FORM USIGN PASSWORD
                                const LoginUsingPassword(),
                              ],
                            ),
                          );
                        },
                      ),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Login Using password",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
