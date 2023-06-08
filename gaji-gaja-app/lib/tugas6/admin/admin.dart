import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_ubah/tugas6/admin/page1.dart';
import 'package:tugas_ubah/tugas6/admin/page2.dart';
import 'package:tugas_ubah/tugas6/admin/page3.dart';
import 'package:tugas_ubah/tugas6/admin/page4.dart';
import 'package:tugas_ubah/tugas6/admin/testing.dart';
import 'package:tugas_ubah/tugas6/cubits/cubit/login_cubit.dart';
import 'package:tugas_ubah/tugas6/models/models.dart';
import 'package:tugas_ubah/tugas6/models/models_future.dart';

import '../akuninfo/mainpage.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(183, 243, 243, 243),
      appBar: AppBar(
        title: Text('Data Perusahan'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              context.read<LoginCubit>().logout();
            },
            icon: const Icon(
              Icons.logout,
              size: 24.0,
            ),
          ),
          IconButton(
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InfoAkunPegawai()));
              setState(() {});
            },
            icon: const Icon(
              Icons.account_box,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Welcome ${dataPegawai['nama']}",
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              // ),
              Container(
                // color: Colors.blue,
                child: Column(
                  children: [
                    Text(
                      'Jumlah Data',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.amber
                              // color: Colors.amber
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FutureBuilder(
                                future: showAccount(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<dynamic> json =
                                        jsonDecode(snapshot.data!.body);
                                    return Text(
                                      json.length.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                              Text('Pengguna'),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.amber
                              // color: Colors.amber
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FutureBuilder(
                                future: showPegawai(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<dynamic> json =
                                        jsonDecode(snapshot.data!.body);
                                    return Text(
                                      json.length.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                              Text('Pegawai'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.amber),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FutureBuilder(
                                future: showApprovalAll(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<dynamic> json =
                                        jsonDecode(snapshot.data!.body);
                                    return Text(
                                      json.length.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                              Text('Approval'),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.amber),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FutureBuilder(
                                future: showCutiAll(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<dynamic> json =
                                        jsonDecode(snapshot.data!.body);
                                    return Text(
                                      json.length.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                              Text('Cuti        '),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Expanded(
                    child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lihat Data',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.35,
                            width: MediaQuery.of(context).size.width * 0.39,
                            child: GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PageKe1()),
                                );
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.account_box, size: 40),
                                    Text("Data Akun"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.35,
                            width: MediaQuery.of(context).size.width * 0.39,
                            child: GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PageKe2()),
                                );
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.people, size: 40),
                                    Text("Data Pegawai"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.35,
                            width: MediaQuery.of(context).size.width * 0.39,
                            child: GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PageKe3()),
                                );
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.approval, size: 40),
                                    Text("Data Pengajuan"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.35,
                            width: MediaQuery.of(context).size.width * 0.39,
                            child: GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PageKe4()),
                                );
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.history, size: 40),
                                    Text("Riwayat Cuti"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              )
            ],
          ),
        ),
      ),

      // body: DefaultTabController(
      //   initialIndex: 1,
      //   length: 3,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: const [
      //         SizedBox(
      //           height: 50,
      //           child: TabBar(
      //             dividerColor: Colors.amber,
      //             labelColor: Colors.amber,

      //             tabs: <Widget>[
      //               Tab(
      //                 icon: Icon(Icons.cloud_outlined),
      //               ),
      //               Tab(
      //                 icon: Icon(Icons.beach_access_sharp),
      //               ),
      //               Tab(
      //                 icon: Icon(Icons.brightness_5_sharp),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Expanded(
      //           child: TabBarView(
      //             children: <Widget>[
      //               SizedBox(height: 10, child: Text("It's cloudy here")),
      //               SizedBox(height: 10, child: Text("It's cloudy here")),
      //               SizedBox(height: 10, child: Text("It's cloudy here")),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
