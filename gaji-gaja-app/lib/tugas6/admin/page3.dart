import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugas_ubah/tugas6/models/models_future.dart';

class PageKe3 extends StatefulWidget {
  const PageKe3({super.key});

  @override
  State<PageKe3> createState() => _PageKe3State();
}

class _PageKe3State extends State<PageKe3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Approval"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
            future: showApprovalAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> json = jsonDecode(snapshot.data!.body);
                return SingleChildScrollView(
                  child: Column(
                    children: json
                        .map(
                          (data) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Container(
                                    width: double.infinity,
                                    height: 193,
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
                                              Text("Tanggal",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(data['tanggal_perizinan'])
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Alasan",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(data['alasan'])
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Rincian",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(data['rincian'])
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
                                                    await deleteDataApproval(
                                                        data['id']);
                                                    setState(() {});
                                                    postDataApprovCuti({
                                                      "tanggal_perizinan": data[
                                                          'tanggal_perizinan'],
                                                      "rincian":
                                                          data['rincian'],
                                                      "alasan": data['alasan'],
                                                      "nama": data['nama'],
                                                      "username":
                                                          data['username']
                                                    });
                                                  },
                                                  child: Text("Approve Cuti")),
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    await deleteDataApproval(
                                                        data['id']);
                                                    setState(() {});
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.red),
                                                  child:
                                                      Text("Delete Appproval")),
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
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
