import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../constrant/constant.dart';
import '../../cubits/cubit/login_cubit.dart';
import 'forgotpass/forgot_password.dart';

var dataUser;
String? name;

class LoginUsingPassword extends StatefulWidget {
  const LoginUsingPassword({super.key});

  @override
  State<LoginUsingPassword> createState() => _LoginUsingPasswordState();
}

class _LoginUsingPasswordState extends State<LoginUsingPassword> {
  // controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

// login func
  final _formKey = GlobalKey<FormState>();

// show / hide password
  final textFieldFocusNode = FocusNode();
  int code = 0;
  bool _isVisible = false;
  bool _isFirstLogin = true;

  Future<http.Response> postData(Map<String, String> data) async {
    print(data);
    final response =
        await http.post(Uri.parse("http://$localAddress:8081/user/loginV2"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data));

    final response2 =
        await http.post(Uri.parse("http://$localAddress:8081/user/findEmail"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data));
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
    setState(() {
      _isVisible = !_isVisible;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: [
                Icon(
                  IconlyLight.arrowLeft,
                  color: Colors.grey,
                ),
                Text(
                  "Back",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        sizedBoxH20,
        Text(
          "Using Password",
          style: TextStyle(
              fontSize: 30, color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        Container(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
            // height: 450,

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
                          return 'Please enter your email';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Please Enter Right Email';
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
                        hintText: " Email",
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
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
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
                        labelText: ' Password',
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
                        hintText: " Password",
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

                    sizedBoxH40,
                    // SIGN IN BUTTON
                    // ------------------
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
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
                            await CircularProgressIndicator();

                            print(_emailController.text);

                            await postData(
                              {
                                "email": _emailController.text,
                                "password": _passwordController.text,
                              },
                            ).then(
                              (value) => {
                                if (Navigator.canPop(context))
                                  {
                                    Navigator.pop(context),
                                  },
                                if (code == 500)
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          'Email / Password Salah',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  }
                                else
                                  {context.read<LoginCubit>().login(1)}
                              },
                            );

                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                          }

                          ;
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
                    sizedBoxH20,
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
