import 'package:flutter/material.dart';

class PageSatu extends StatefulWidget {
  const PageSatu({super.key});

  @override
  State<PageSatu> createState() => _PageSatuState();
}

class _PageSatuState extends State<PageSatu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Page Satu"),
      ),
    );
  }
}
