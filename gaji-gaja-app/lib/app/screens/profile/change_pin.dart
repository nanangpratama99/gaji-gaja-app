import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tugas_ubah/app/constrant/constant.dart';
import 'package:http/http.dart' as http;

import '../../cubits/cubit/login_cubit.dart';
import '../auth/login_pin.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final TextEditingController _pinController = TextEditingController();
  // login func
  final _formKey = GlobalKey<FormState>();

  Future<http.Response> updatePin(Map<String, String> data) async {
    print(data);
    final response = await http.post(
      Uri.parse("http://$localAddress:8081/user/save"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(test),
    );

    // print(jsonDecode(dataUser)['pin']);

    return response;
  }

  var test = jsonDecode(dataUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Reset",
                style: TextStyle(fontSize: 30, color: Colors.black54),
              ),
              Text(
                "Your Pin",
                style: TextStyle(fontSize: 30, color: Colors.black54),
              ),
              sizedBoxH20,
              // icon pin
              Icon(
                IconlyLight.lock,
                color: Colors.grey,
                size: 150,
              ),
              sizedBoxH40,
              // pin conde
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: PinCodeTextField(
                    controller: _pinController,
                    validator: (value) {
                      if (value == null || value == "") {
                        print("empty");
                      }
                      return null;
                    },
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
                    onCompleted: (v) {
                      print("Completed");
                      test['pin'] = v;
                      print(test['pin']);
                      print(test);
                    },
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),
                ),
              ),
              sizedBoxH40,
              //
              Container(
                margin: EdgeInsetsDirectional.symmetric(
                  horizontal: 50,
                ),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Radius sudut tombol
                    ),
                    primary: primaryColor, // Warna latar belakang tombol
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      CircularProgressIndicator();
                      print(_pinController.text);
                      print(test);

                      var response = await updatePin(
                        {
                          "pin": _pinController.text,
                        },
                      );
                    }
                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
