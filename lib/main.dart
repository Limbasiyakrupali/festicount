import 'package:festival_app/screens/detailpage.dart';
import 'package:festival_app/screens/editpage.dart';
import 'package:festival_app/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const homepage(),
        'detailpage': (context) => const detailpage(),
        'editpage': (context) => const editpage(),
      },
    ),
  );
}
