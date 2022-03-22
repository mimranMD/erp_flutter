import 'package:flutter/material.dart';

class FinancialDashBoard extends StatefulWidget {
  const FinancialDashBoard({Key? key}) : super(key: key);

  @override
  State<FinancialDashBoard> createState() => _FinancialDashBoardState();
}

class _FinancialDashBoardState extends State<FinancialDashBoard> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Image.asset('assets/dash/menu.png', width: 30, height: 30),
        actions: [
          Image.asset('assets/dash/alarm.png', width: 30, height: 30),
        ],
        title: Image.asset('assets/dash/logo.png', width: deviceWidth * .8),
      ),
      body: SizedBox(
        height: deviceHeight ,
        width: deviceWidth ,
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
             const Text(
                    "Salary for Month",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff535552)),
                  ),
                  const Text(
                    "OMR 31,627.80",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff535552)),
                  ),
                  Divider(
                    color:  Color(0xffD9DBE9,)
                  ),

                  Row(children: [
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                    "Total Money Invested",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6E7191)),
                  ),
                  const Text(
                    "OMR 31,477.50",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff535552)),
                  ),
                      ],
                    ),
                     Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                    "Repayment Done",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6E7191)),
                  ),
                  const Text(
                    "OMR 0",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff535552)),
                  ),
                      ],
                    ),
                  ],)
          ],
        ),
      )

    );
  }
}
