import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugas_ubah/tugas6/models/models.dart';

import 'package:http/http.dart' as http;

import '../models/models_future.dart';

final _formKey = GlobalKey<FormState>();
final TextEditingController _textController = TextEditingController();
final TextEditingController _textController1 = TextEditingController();
final TextEditingController _textController2 = TextEditingController();
final TextEditingController _textController3 = TextEditingController();

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Admin"), value: "1"),
    DropdownMenuItem(child: Text("Member"), value: "2"),
  ];
  return menuItems;
}

class PageKe1 extends StatefulWidget {
  const PageKe1({super.key});

  @override
  State<PageKe1> createState() => _PageKe1State();
}

class _PageKe1State extends State<PageKe1> {
  String selectedValue = "1";

  Stream<http.Response> streamData = Stream.fromFuture(showAccount());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Akun"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: showAccount(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<dynamic> json = jsonDecode(snapshot.data!.body);
                  return Column(
                    children: json
                        .map(
                          (data) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Container(
                                    width: double.infinity,
                                    height: 185,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Color.fromARGB(118, 0, 0, 0),
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 200,
                                              height: 33,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          17.0),
                                                  color: Color.fromARGB(
                                                      99, 68, 137, 255)),
                                              child: Center(
                                                  child:
                                                      int.parse(data['role']) ==
                                                              1
                                                          ? Text("Admin")
                                                          : Text("Not Admin"))),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Username",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(data['username'])
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Email",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(data['email'])
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    _textController1.text =
                                                        data['username'];
                                                    _textController2.text =
                                                        data['email'];
                                                    selectedValue =
                                                        data['role'];
                                                    await showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                StateSetter
                                                                    setState) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Update Role'),
                                                            content:
                                                                SingleChildScrollView(
                                                              child: Form(
                                                                key: _formKey,
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    TextFormField(
                                                                      controller:
                                                                          _textController1,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        label: Text(
                                                                            'Username'),
                                                                      ),
                                                                      enabled:
                                                                          false,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter some text';
                                                                        }
                                                                        return null;
                                                                      },
                                                                    ),
                                                                    TextFormField(
                                                                      controller:
                                                                          _textController2,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        label: Text(
                                                                            'Email'),
                                                                      ),
                                                                      enabled:
                                                                          false,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter some text';
                                                                        }
                                                                        return null;
                                                                      },
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          DropdownButton(
                                                                        value:
                                                                            selectedValue,
                                                                        items:
                                                                            dropdownItems,
                                                                        isExpanded:
                                                                            true,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            selectedValue =
                                                                                value.toString();
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .all(
                                                                          13.0),
                                                                      child:
                                                                          ElevatedButton(
                                                                        child: Text(
                                                                            'Submit'),
                                                                        onPressed: (dataLogin['username'] ==
                                                                                data['username'])
                                                                            ? null
                                                                            : () async {
                                                                                if (_formKey.currentState!.validate()) {
                                                                                  await updateDataAkunih(data['id'], {
                                                                                    "role": selectedValue
                                                                                  });
                                                                                  if (statuscodeAkun == 200) {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      const SnackBar(content: Text('Data Diubah')),
                                                                                    );
                                                                                  } else if (statuscodeAkun == 404) {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      const SnackBar(content: Text('Email/Username sama')),
                                                                                    );
                                                                                  }
                                                                                  _textController1.clear();
                                                                                  _textController2.clear();
                                                                                  setState(() {});

                                                                                  Navigator.of(context).pop();
                                                                                }
                                                                              },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      },
                                                    );
                                                    setState(() {});
                                                    // Navigator.of(context).pop();
                                                  },
                                                  child: Text("Update Role")),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  await deleteDataAccounts(
                                                      data['id']);
                                                  setState(() {});
                                                },
                                                child: Text("Delete Account"),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            )),
      ),
    );
  }
}
