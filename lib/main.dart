import 'package:erp_flutter/Views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'Views/home/dashboard_detail.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
