import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_ubah/tugas6/models/models.dart';
import 'package:tugas_ubah/tugas6/models/models_future.dart';
import 'package:tugas_ubah/tugas6/screens/regist.dart';

import '../cubits/cubit/login_cubit.dart';

bool obsecure = true;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int testingcuy = 0;
  final _formKey = GlobalKey<FormState>();
  final emailinput = TextEditingController();
  final passwordinput = TextEditingController();
  late int role;
  
  Future<http.Response> postData(Map<String, String> data) async {
    final response = await http.post(
        Uri.parse("http://steirone.my.id/laravel8/public/api/accountq/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    try {
      final responseBody = json.decode(response.body);
      final isiPegawai = await http.get(
        Uri.parse(
            "http://steirone.my.id/laravel8/public/api/pegawai/nama/${responseBody['username']}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      dataPegawai = jsonDecode(isiPegawai.body);
      role = int.parse(responseBody['role']);
      final panjangcuiii = await http.get(
        Uri.parse(
            "http://steirone.my.id/laravel8/public/api/cuti/username/${responseBody['username']}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      panjangcuti = jsonDecode(panjangcuiii.body);
      panjangcuti = panjangcuti.length;
      dataLogin = responseBody;
      print(dataLogin);
      print(dataPegawai);
      testingcuy = response.statusCode;
      return response;
    } catch (e) {
      testingcuy = response.statusCode;
      return response;
    }
  }

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
                "Login Your Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Text(
                "Please Login",
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
                    // Text("Email Address"),
                    TextFormField(
                      controller: emailinput,
                      decoration: const InputDecoration(
                        label: Text("Email Address"),
                        // icon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.none,
                              color: Colors.grey),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
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
                          label: Text("Password"),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                            );
                            await postData(
                              {
                                "email": emailinput.text,
                                "password": passwordinput.text,
                              },
                            );
                            if (testingcuy == 200) {
                              if (role == 1) {
                                context.read<LoginCubit>().login(1);
                              } else {
                                context.read<LoginCubit>().login(2);
                              }
                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Email / Password Salah')),
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
                              "Sign In",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(Icons.arrow_circle_right_outlined,
                                color: Colors.black),
                          ],
                        ),

                        // child: const Text('Submit'),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Call Administrator')),
                          );
                        },
                        child: Text("Forgot Your Password?"))
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Dont Have Acount "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
