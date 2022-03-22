import 'package:erp_flutter/Views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Views/home/dashboard_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
fontFamily: 'Roboto'
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
