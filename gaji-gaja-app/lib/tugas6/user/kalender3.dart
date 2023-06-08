import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tugas_ubah/tugas6/akuninfo/mainpage.dart';
import 'package:tugas_ubah/tugas6/cubits/cubit/login_cubit.dart';
import 'package:tugas_ubah/tugas6/models/models.dart';
import 'package:tugas_ubah/tugas6/models/models_future.dart';

class Event {
  final String title;
  Event({required this.title});

  String toString() => this.title;
}

late Map<DateTime, List<Event>> selectedEvents;
late Map<DateTime, List<Event>> permohonanIzin;
CalendarFormat format = CalendarFormat.month;
DateTime selectedDay = DateTime.now();
DateTime focusedDay = DateTime.now();
var add1 = TextEditingController();
final add2 = TextEditingController();
var _pageview = PageController(initialPage: 1);

final TextEditingController _eventController = TextEditingController();

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Sakit"), value: "Sakit"),
    DropdownMenuItem(child: Text("Izin"), value: "Izin"),
    DropdownMenuItem(child: Text("Keperluan Lain"), value: "Keperluan Lain"),
  ];
  return menuItems;
}

String selectedValue = "Sakit";
// double widthh = 10;

Future<void> getData() async {
  selectedEvents = {};
  final response =
      await http.get(Uri.parse("https://api-harilibur.vercel.app/api"));
  List<dynamic> json = jsonDecode(response.body);
  for (var i = 0; i < json.length; i++) {
    if (json[i]["is_national_holiday"] == true) {
      if (json[i]["holiday_date"].length == 9) {
        var time = json[i]["holiday_date"].substring(0, 8) +
            '0' +
            json[i]["holiday_date"].substring(8, 9);
        selectedDay = DateTime.parse(time + " 07:00:00.000").toUtc();
      } else {
        selectedDay =
            DateTime.parse(json[i]["holiday_date"] + " 07:00:00.000").toUtc();
      }
      _eventController.text = json[i]["holiday_name"];
      Event event = Event(title: _eventController.text);
      selectedEvents[selectedDay] = [event];
      selectedDay = DateTime.now();
    }
  }
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  void initState() {
    getData();
    setState(() {});
    super.initState();
    // _eventController = TextEditingController();
  }

  //   @override
  // void dispose() {
  //   _eventController.dispose();
  //   super.dispose();
  // }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalendar Perusahan'),
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InfoAkunPegawai()));
            },
            icon: const Icon(
              Icons.account_box,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.blue),
        child: Stack(
          children: [
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 24,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  children: [
                    TableCalendar(
                      focusedDay: selectedDay,
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2050),
                      calendarFormat: format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          format = _format;
                        });
                      },
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      daysOfWeekVisible: true,

                      //Day Changed
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          add1.text = selectDay.toString().substring(0, 10);
                          print(selectedDay);
                          focusedDay = focusDay;
                        });
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },

                      eventLoader: _getEventsfromDay,

                      //To style the Calendar
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: TextStyle(color: Colors.white),
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          // borderRadius: BorderRadius.circular(5.0),
                        ),
                        selectedTextStyle: TextStyle(color: Colors.black),
                        todayDecoration: BoxDecoration(
                          // color: Colors.purpleAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        defaultDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        weekendDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        weekendTextStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 212, 17, 17),
                          height: 1.3333333333333333,
                        ),
                      ),
                      calendarBuilders: CalendarBuilders(
                        singleMarkerBuilder: (context, date, _) {
                          return Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black), //Change color
                            width: 5.0,
                            height: 5.0,
                            margin: const EdgeInsets.symmetric(horizontal: 1.5),
                          );
                        },
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        titleTextStyle:
                            TextStyle(fontSize: 14, color: Colors.white),
                        formatButtonTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ..._getEventsfromDay(selectedDay).map(
                      (Event event) => ListTile(
                        title: Text(
                          event.title,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                    height: 400,
                    // width: 100,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Colors.white,
                      ),
                      // color: Colors.red,
                      child: PageView(
                        controller: _pageview,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Container(
                              child: FutureBuilder(
                                  future: showCuti(dataLogin['username'])
                                      .then((value) => value.body),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<dynamic> json =
                                          jsonDecode(snapshot.data!);
                                      int result = 12 - json.length;
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Izin Tersedia",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text("Izin Terpakai",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("${result}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text("${json.length}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 250,
                                            child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: DataTable(
                                                  columns: const <DataColumn>[
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Text(
                                                          'Nama',
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Text(
                                                          'Tanggal',
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Text(
                                                          'Alasan',
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  rows: json.map((item) {
                                                    return DataRow(cells: [
                                                      DataCell(
                                                          Text(item['nama'])),
                                                      DataCell(Text(item[
                                                          'tanggal_perizinan'])),
                                                      DataCell(
                                                          Text(item['alasan'])),
                                                    ]);
                                                  }).toList(),
                                                )),
                                          )
                                        ],
                                      );
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Minta Perizinan Cuti",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.44,
                                        child: Text("Tanggal Perizinan")),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.44,
                                        child: Text("Alasan"))
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(29, 136, 163, 236),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: TextField(
                                          enabled: false,
                                          controller: add1,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      child: DropdownButton(
                                        value: selectedValue,
                                        items: dropdownItems,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value.toString();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text("Rincian"),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 9, right: 9),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.88,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(29, 136, 163, 236),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: TextField(
                                        controller: add2,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 2, right: 2),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: ElevatedButton(
                                        onPressed: (panjangcuti >= 12)
                                            ? null
                                            : () async {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  },
                                                );
                                                await postDataCuti({
                                                  "tanggal_perizinan":
                                                      add1.text,
                                                  "rincian": add2.text,
                                                  "alasan": selectedValue,
                                                  "nama": dataPegawai['nama'],
                                                  "username":
                                                      dataLogin['username']
                                                });
                                                _pageview.jumpToPage(2);
                                                Navigator.pop(context);
                                                add1.clear();
                                                add2.clear();
                                                setState(() {});
                                              },
                                        child: Text("Ajukan")),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 2, right: 2),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.white, // Background color
                                        ),
                                        onPressed: () {
                                          _pageview.jumpToPage(0);
                                        },
                                        child: Text(
                                          "Lihat Riwayat Izin & Izin Tersedia",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                const Text("Pengajuan Izin Cuti",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 250,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: FutureBuilder(
                                        future:
                                            showApproval(dataLogin['username'])
                                                .then((value) => value.body),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            List<dynamic> json =
                                                jsonDecode(snapshot.data!);
                                            return DataTable(
                                              columns: const <DataColumn>[
                                                DataColumn(
                                                  label: Expanded(
                                                    child: Text(
                                                      'Tanggal',
                                                      style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Expanded(
                                                    child: Text(
                                                      'Alasan',
                                                      style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Expanded(
                                                    child: Text(
                                                      'Tindakan',
                                                      style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              rows: json.map((item) {
                                                return DataRow(cells: [
                                                  DataCell(Text(item[
                                                      'tanggal_perizinan'])),
                                                  DataCell(
                                                      Text(item['alasan'])),
                                                  DataCell(IconButton(
                                                      onPressed: () async {
                                                        await deleteDataApproval(
                                                            item['id']);
                                                        setState(() {});
                                                      },
                                                      icon:
                                                          Icon(Icons.delete))),
                                                ]);
                                              }).toList(),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        }),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
