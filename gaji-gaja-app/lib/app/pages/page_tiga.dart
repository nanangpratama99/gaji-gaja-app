import 'package:flutter/material.dart';

class PageTiga extends StatefulWidget {
  const PageTiga({super.key});

  @override
  State<PageTiga> createState() => _PageTigaState();
}

class _PageTigaState extends State<PageTiga> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text("Page Tiga"),
      ),
    );
  }
}
