import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../constrant/constant.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color.fromARGB(93, 158, 158, 158)),
                ),
                child: const Icon(
                  IconlyLight.arrowLeft,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
            ), // Widget Expanded untuk mengisi ruang dan memisahkan ikon dan teks
            const Text(
              "Edit Profile",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        actions: [], // Aksi tambahan, jika ada
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _fotoProfile(),
            _title(),
            Form(
              child: Column(
                children: [
                  _inputText("Full Name", IconlyLight.addUser),
                  _inputText("Email", IconlyLight.document),
                  _inputText("Phone Number", IconlyLight.call),
                  SizedBox(
                    height: 20,
                  ),
                  _updateButton(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _fotoProfile() {
  return Center(
    child: Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: 12),
      width: 170,
      height: 170,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        border: Border.all(
          color: Color.fromARGB(107, 158, 158, 158),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Image.asset(
          "asset/image/suzume.jpg",
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget _title() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Text(
      "Edit Your Data Below",
      style: TextStyle(fontSize: 18, color: Colors.black54),
    ),
  );
}

Widget _inputText(
  String name,
  IconData icon,
) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
    child: TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black54),
        ),
        hintStyle: TextStyle(color: Colors.grey),
        hintText: name,
        prefixIcon: Container(
          width: 5, // Lebar garis vertikal
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 25,
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              Icon(icon), // Icon di sebelah kiri
            ],
          ),
        ),
      ),
      style: TextStyle(color: Colors.black54),
      keyboardType: name == 'Email' || name == 'Full Name'
          ? TextInputType.text
          : TextInputType.phone,
    ),
  );
}

Widget _updateButton(context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
    width: MediaQuery.of(context).size.width,
    height: 65,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: primaryColor,
    ),
    child: const Center(
      child: Text(
        "Update",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
  );
}
