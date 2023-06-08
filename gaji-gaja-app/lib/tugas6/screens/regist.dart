import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_ubah/tugas6/screens/login.dart';
import 'package:tugas_ubah/tugas6/screens/login_screen.dart';

bool obsecure = true;
bool obsecure1 = true;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailinput = TextEditingController();
  final passwordinput = TextEditingController();
  final passwordinput2 = TextEditingController();
  final usernameinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome On Board"),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Create Your Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Text(
                "Please Fill your Data",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: usernameinput,
                      decoration: const InputDecoration(
                        label: Text('Username'),
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.none,
                              color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Email Address'),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.none,
                              color: Colors.grey),
                        ),
                      ),
                      controller: emailinput,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Please Enter Right Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text('Password'),
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none,
                                color: Colors.grey),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obsecure = !obsecure;
                              });
                              // print(obsecure);
                            },
                            icon: Icon(obsecure
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      obscureText: obsecure,
                      controller: passwordinput,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text('Re-Password'),
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none,
                                color: Colors.grey),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obsecure1 = !obsecure1;
                              });
                              // print(obsecure);
                            },
                            icon: Icon(obsecure1
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      obscureText: obsecure1,
                      controller: passwordinput2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (passwordinput.text == passwordinput2.text) {
                              postData(
                                {
                                  "username": usernameinput.text,
                                  "email": emailinput.text,
                                  "password": passwordinput.text,
                                  "role": "2"
                                },
                              );
                              if (statuscode == 201) {
                                postData2({
                                  "nama": "null",
                                  "tempat_tanggal_lahir": "null",
                                  "alamat": "null",
                                  "username": usernameinput.text
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Silahkan Login')),
                                );
                                usernameinput.clear();
                                emailinput.clear();
                                passwordinput.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Email Sudah Ada')),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Password Tidak Sama')),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(width: 0.5),
                            fixedSize: Size(double.infinity, 40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(''),
                            Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(Icons.arrow_circle_right_outlined,
                                color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already Have Acount "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Future<http.Response> postData(Map<String, String> data) async {
  final response = await http.post(
      Uri.parse("http://steirone.my.id/laravel8/public/api/accountq"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  statuscode = response.statusCode;
  print(statuscode);
  print(response.body);
  return response;
}

Future<http.Response> postData2(Map<String, String> data) async {
  final response = await http.post(
      Uri.parse("http://steirone.my.id/laravel8/public/api/pegawai"),
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
