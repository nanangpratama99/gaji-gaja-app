import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../models/models_future.dart';

class AkunInfo extends StatefulWidget {
  const AkunInfo({super.key});

  @override
  State<AkunInfo> createState() => _AkunInfoState();
}

class _AkunInfoState extends State<AkunInfo> {
  final _formKey = GlobalKey<FormState>();
  final emailinput = TextEditingController();
  final passwordinput = TextEditingController();
  final usernameinput = TextEditingController();

  void initState() {
    statuscodeAkun = 0;
    super.initState();
    // _eventController = TextEditingController();
  }

  bool tesr = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Username"),
            TextFormField(
              enabled: false,
              controller: usernameinput,
              decoration: const InputDecoration(
                // hintText: 'Username',
                // icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                label: Text("Username"),
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
            // Text("Email Address"),
            TextFormField(
              enabled: tesr,
              decoration: const InputDecoration(
                // hintText: 'Email Address',
                // icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                label: Text("Email Address"),
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
            // Text("Password"),
            TextFormField(
              enabled: tesr,
              decoration: const InputDecoration(
                // hintText: 'Password',
                // icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                label: Text("Password"),
              ),
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
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (!tesr) {
                        setState(() {
                          tesr = !tesr;
                        });
                        await getDataAkun(dataLogin['id']);
                        usernameinput.text = dataLogin['username'];
                        emailinput.text = dataLogin['email'];
                        setState(() {});
                      } else {
                        if (_formKey.currentState!.validate()) {
                          await updateDataAkun(dataLogin['id'], {
                            "username": usernameinput.text,
                            "email": emailinput.text,
                            "password": passwordinput.text,
                            "role": dataLogin['role']
                          });
                          setState(() {});
                          if (statuscodeAkun == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Data Diubah')),
                            );
                          } else if (statuscodeAkun == 404) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Email/Username sama')),
                            );
                          }
                          usernameinput.clear();
                          passwordinput.clear();
                          emailinput.clear();
                          setState(() {
                            tesr = !tesr;
                          });
                        }
                      }
                    },
                    child: Text(tesr ? "Update Data" : "Show Info"),
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
