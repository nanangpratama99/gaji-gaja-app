import 'package:flutter/material.dart';
import 'package:tugas_ubah/tugas6/akuninfo/akun.dart';
import 'package:tugas_ubah/tugas6/akuninfo/pegawai.dart';

class InfoAkunPegawai extends StatefulWidget {
  const InfoAkunPegawai({super.key});

  @override
  State<InfoAkunPegawai> createState() => _InfoAkunPegawaiState();
}

class _InfoAkunPegawaiState extends State<InfoAkunPegawai> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Data'),
      ),
      body: Column(
        children: [
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Akun',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Biodata',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
          IndexedStack(
            index: _selectedIndex,
            children: [
              AkunInfo(),
              PegawaiInfo(),
            ],
          ),
        ],
      ),
    );
  }
}
