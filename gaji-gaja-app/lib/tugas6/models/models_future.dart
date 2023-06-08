import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models.dart';

Future<http.Response> showApproval(String username) async {
  final response = await http.get(Uri.parse(
      "http://steirone.my.id/laravel8/public/api/approval/username/${username}"));
  return response;
}

Future<http.Response> showCuti(String username) async {
  final response = await http.get(Uri.parse(
      "http://steirone.my.id/laravel8/public/api/cuti/username/${username}"));
  return response;
}

Future<http.Response> showAccount() async {
  final response = await http
      .get(Uri.parse("http://steirone.my.id/laravel8/public/api/accountq"));
  return response;
}

Future<http.Response> showPegawai() async {
  final response = await http
      .get(Uri.parse("http://steirone.my.id/laravel8/public/api/pegawai"));
  return response;
}

Future<http.Response> showApprovalAll() async {
  final response = await http
      .get(Uri.parse("http://steirone.my.id/laravel8/public/api/approval"));
  return response;
}

Future<http.Response> showCutiAll() async {
  final response = await http
      .get(Uri.parse("http://steirone.my.id/laravel8/public/api/cuti"));
  return response;
}

Future<http.Response> postDataCuti(Map<String, String> data) async {
  final response = await http.post(
      Uri.parse("http://steirone.my.id/laravel8/public/api/approval"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  print(response.statusCode);
  print(response.body);
  return response;
}

Future<http.Response> postDataApprovCuti(Map<String, String> data) async {
  final response = await http.post(
      Uri.parse("http://steirone.my.id/laravel8/public/api/cuti"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  print(response.statusCode);
  print(response.body);
  return response;
}

Future<http.Response> deleteDataApproval(id) async {
  final response = await http.delete(
    Uri.parse("http://steirone.my.id/laravel8/public/api/approval/${id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.statusCode);
  print(response.body);
  return response;
}

Future<http.Response> deleteDataPegawaian(id) async {
  final response = await http.delete(
    Uri.parse("http://steirone.my.id/laravel8/public/api/pegawai/${id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.statusCode);
  print(response.body);
  return response;
}

Future<http.Response> deleteDataCuties(id) async {
  final response = await http.delete(
    Uri.parse("http://steirone.my.id/laravel8/public/api/cuti/${id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.statusCode);
  print(response.body);
  return response;
}

Future<http.Response> deleteDataAccounts(id) async {
  final response = await http.delete(
    Uri.parse("http://steirone.my.id/laravel8/public/api/accountq/${id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.statusCode);
  print(response.body);
  return response;
}

//################################# Akun #######################################
Future<http.Response> updateDataAkun(int id, Map<String, String> data) async {
  final response = await http.put(
      Uri.parse("http://steirone.my.id/laravel8/public/api/accountq/${id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  statuscodeAkun = response.statusCode;
  print(statuscodeAkun);
  print(response.body);
  return response;
}

Future<http.Response> updateDataAkunih(int id, Map<String, String> data) async {
  final response = await http.put(
      Uri.parse("http://steirone.my.id/laravel8/public/api/accountq/role/${id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  statuscodeAkun = response.statusCode;
  print(statuscodeAkun);
  print(response.body);
  return response;
}

late int statuscodeAkun;

Future<http.Response> getDataAkun(id) async {
  final response = await http.get(
    Uri.parse("http://steirone.my.id/laravel8/public/api/accountq/${id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.statusCode);
  dataLogin = json.decode(response.body);
  return response;
}

//##############################################################################

// Batas

//############################### Pegawai ######################################
Future<http.Response> updateDataPegawais(
    int id, Map<String, String> data) async {
  final response = await http.put(
      Uri.parse("http://steirone.my.id/laravel8/public/api/pegawai/${id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  statuscodePegawai = response.statusCode;
  print(statuscodePegawai);
  print(response.body);
  return response;
}

late int statuscodePegawai;

Future<http.Response> getDataPegawais(String nama) async {
  final response = await http.get(
    Uri.parse("http://steirone.my.id/laravel8/public/api/pegawai/nama/${nama}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.statusCode);
  print(response.body);
  dataPegawai = json.decode(response.body);
  return response;
}

//##############################################################################
