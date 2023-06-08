import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tugas_ubah/tugas6/models/models.dart';

import '../models/models_future.dart';

class PegawaiInfo extends StatefulWidget {
  const PegawaiInfo({super.key});

  @override
  State<PegawaiInfo> createState() => _PegawaiInfoState();
}

class _PegawaiInfoState extends State<PegawaiInfo> {
  final _formKey = GlobalKey<FormState>();
  final ttlinput = TextEditingController();
  final alamatinput = TextEditingController();
  final namainput = TextEditingController();

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
              enabled: tesr,
              controller: namainput,
              decoration: const InputDecoration(
                // hintText: 'Username',
                // icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                label: Text("Nama Lengkap"),
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
                label: Text("Tempat Tanggal Lahir"),
              ),
              controller: ttlinput,
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
            // Text("Password"),
            TextFormField(
              enabled: tesr,
              decoration: const InputDecoration(
                // hintText: 'Password',
                // icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                label: Text("Alamat"),
              ),
              controller: alamatinput,
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
                        await getDataPegawais(dataLogin['username']);
                        namainput.text = dataPegawai['nama'];
                        alamatinput.text = dataPegawai['alamat'];
                        ttlinput.text = dataPegawai['tempat_tanggal_lahir'];
                        setState(() {});
                      } else {
                        if ((_formKey.currentState!.validate())) {
                          await updateDataPegawais(dataPegawai['id'], {
                            "nama": namainput.text,
                            "tempat_tanggal_lahir": ttlinput.text,
                            "alamat": alamatinput.text,
                            "username": dataPegawai['username']
                          });
                          setState(() {});
                          if (statuscodePegawai == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Data Diubah')),
                            );
                          } else if (statuscodePegawai == 404) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Email/Username sama')),
                            );
                          }
                          setState(() {});
                          dataPegawai['nama'] = namainput.text;
                          namainput.clear();
                          alamatinput.clear();
                          ttlinput.clear();
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
