import 'package:erp_flutter/Views/home/dashboard_main.dart';
import 'package:erp_flutter/Widgets/r_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../Widgets/custom_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool status = false;
  bool valueFirst = false;
  bool valueSecond = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: deviceHeight,
            width: deviceWidth,
            color: const Color(0xffF5D547),
            child: SizedBox(
              width: deviceWidth * .8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff535552)),
                  ),
                  const Text(
                    "Client Code",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff535552)),
                  ),
                  Card(
                    child: signUpWidget(context, firstController,
                        labelText: "GLOO1"),
                  ),
                  const Text(
                    "User Name",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff535552)),
                  ),
                  Card(
                    child: signUpWidget(context, firstController,
                        labelText: "Mike john12"),
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff535552)),
                  ),
                  Card(
                    child: signUpWidget(context, firstController,
                        labelText: "*******"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterSwitch(
                        activeColor: const Color(0xffF58A07),
                        inactiveColor: Colors.white,
                        inactiveToggleColor: const Color(0xffF58A07),
                        width: 50.0,
                        height: 24.0,
                        valueFontSize: 25.0,
                        toggleSize: 25.0,
                        value: status,
                        borderRadius: 30.0,
                        padding: 0.0,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                      const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff535552)),
                      ),
                    ],
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPageMain()),
                      );
                    },
                    buttonText: 'Login',
                    textColor: Colors.white,
                    buttonColor: const Color(0xffF58A07),
                    borderColor: const Color(0xffF58A07),
                    borderRadius: 12,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 1,
            child: Container(
              height: deviceHeight * .25,
              width: deviceWidth,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/dash/logo.png', width: deviceWidth * .8),
                  SizedBox(height: 40),
                  const Text(
                    "Al Burhan ERP ",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff535552)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
