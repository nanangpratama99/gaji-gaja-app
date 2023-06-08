import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../models/models_future.dart';

final _formKey = GlobalKey<FormState>();
final TextEditingController _textController = TextEditingController();
final TextEditingController _textController1 = TextEditingController();
final TextEditingController _textController2 = TextEditingController();
final TextEditingController _textController3 = TextEditingController();

class PageKe2 extends StatefulWidget {
  const PageKe2({super.key});

  @override
  State<PageKe2> createState() => _PageKe2State();
}

class _PageKe2State extends State<PageKe2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Pegawai"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
              future: showPegawai(),
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
                                    height: 178,
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
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            data['nama'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Tempat Tanggal Lahir",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(data['tempat_tanggal_lahir'])
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Alamat",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(data['alamat'])
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
                                                  onPressed: () {
                                                    _textController1.text =
                                                        data['nama'];
                                                    _textController2.text = data[
                                                        'tempat_tanggal_lahir'];
                                                    _textController3.text =
                                                        data['alamat'];
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Update Items'),
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
                                                                            label:
                                                                                Text("Nama Lengkap")),
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
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
                                                                          "Tempat Dan Tanggal Lahir"),
                                                                    ),
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
                                                                        return 'Please enter some text';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        _textController3,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    decoration:
                                                                        InputDecoration(
                                                                            label:
                                                                                Text("Alamat")),
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
                                                                        return 'Please enter some number';
                                                                      }
                                                                      return null;
                                                                    },
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
                                                                                await updateDataPegawais(data['id'], {
                                                                                  "nama": _textController1.text,
                                                                                  "tempat_tanggal_lahir": _textController2.text,
                                                                                  "alamat": _textController3.text,
                                                                                  "username": data['username']
                                                                                });
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
                                                      },
                                                    );
                                                  },
                                                  child: Text("Update Data")),
                                              ElevatedButton(
                                                onPressed:
                                                    (dataLogin['username'] ==
                                                            data['username'])
                                                        ? null
                                                        : () async {
                                                            await deleteDataPegawaian(
                                                                data['id']);
                                                            setState(() {});
                                                          },
                                                child: Text("Delete Data"),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red),
                                              )
                                            ],
                                          )
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
              }),
        ),
      ),
    );
  }
}
