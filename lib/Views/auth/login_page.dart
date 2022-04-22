import 'package:erp_flutter/Views/home/dashboard_main.dart';
import 'package:erp_flutter/Widgets/r_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Service/api_call.dart';
import '../../Widgets/custom_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController companyCodeController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //  ProgressDialog pr;
  bool status = false;
  bool valueFirst = false;
  bool valueSecond = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffa1852e),
      // resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          deviceHeight * .22,
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
              child: Container(
                height: deviceHeight * .22,
                width: deviceWidth,
                color: const Color(0xffa1852e),
                child: Container(
                  height: deviceHeight * .22,
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
                      Image.asset('assets/dash/logo.png',
                          width: deviceWidth * .8),
                      const SizedBox(height: 40),
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
              ),
              preferredSize: Size.fromHeight(
                deviceHeight * .22,
              )),
        ),
      ),
      body: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Padding(
          padding: EdgeInsets.only(
              left: deviceWidth * .07, right: deviceWidth * .07),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff535552)),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: deviceHeight * 0.04,
                    ),
                    const Text(
                      "Client Code",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Color(0xff535552)),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.005,
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: signUpWidget(context, companyCodeController,
                          labelText: "GLOO1"),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "User Name",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Color(0xff535552)),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.005,
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: signUpWidget(context, userNameController,
                          labelText: "Mike john12"),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Color(0xff535552)),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.005,
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: signUpWidget(context, passwordController,
                          labelText: "*******"),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.008,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                ),
                SizedBox(
                  height: deviceHeight * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onTap: () async {
                        await ApiCalls()
                            .userLoginF(
                          companyCodeController.text,
                          userNameController.text,
                          passwordController.text,
                        )
                            .then((status) async {
                          // ignore: unrelated_type_equality_checks
                          if (status?.status == "True") {
                            resultsToastFunction(
                                'Succesfull Login', Colors.green.shade500);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardPageMain(
                                        companyId:
                                            companyCodeController.toString(),
                                        lang: 'eng',
                                      )),
                            );
                          } else {
                            resultsToastFunction(
                                'Please Enter Correct Login and Password',
                                Colors.red.shade400);
                          }
                        });
                      },
                      buttonText: 'Login',
                      textColor: Colors.white,
                      buttonColor: const Color(0xffF58A07),
                      borderColor: const Color(0xffF58A07),
                      borderRadius: 12,
                    ),
                    SizedBox(
                      height: deviceHeight * .2,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  resultsToastFunction(String message, Color backgroundColor) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 12.0);
    // pr.hide();
  }
}
