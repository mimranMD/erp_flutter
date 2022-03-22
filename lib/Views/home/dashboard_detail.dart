import 'package:erp_flutter/Views/home/profit_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardDetailPage extends StatefulWidget {
  const DashboardDetailPage({Key? key}) : super(key: key);

  @override
  State<DashboardDetailPage> createState() => _DashboardDetailPageState();
}

class _DashboardDetailPageState extends State<DashboardDetailPage> {
  Widget _title(String titleName, double textScaleFactor, Color textColor) {
    return SizedBox(
      child: Text(
        titleName,
        textScaleFactor: textScaleFactor,
        style: TextStyle(color: textColor),
      ),
    );
  }

  Widget _subHeading(String titleName, double textScaleFactor, Color textColor,
      FontWeight fontWeight) {
    return SizedBox(
      child: Text(
        titleName,
        textScaleFactor: textScaleFactor,
        style: TextStyle(color: textColor, fontWeight: fontWeight),
      ),
    );
  }

  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

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
        leading: Image.asset(
          'assets/dash/menu.png',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfitScreen()),
                );
              },
              child: Image.asset(
                'assets/dash/alarm.png',
                width: 23,
              ),
            ),
          ),
        ],
        title: Expanded(
          child: Image.asset(
            'assets/dash/logo.png',
          ),
        ),
      ),
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: deviceHeight * 0.03),
                _title('Salary for Month', 1.3, Colors.grey.shade500),
                _subHeading('OMR 31,0912', 2.5, Colors.black, FontWeight.w600),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    color: Colors.grey.shade400,
                  ),
                ),
                SizedBox(
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              _title('Total Money Invested', 0.9,
                                  Colors.grey.shade500),
                              _subHeading('OMR 31,0912', 1.8, Colors.black,
                                  FontWeight.w600),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              _title(
                                  'Repayment done', 0.9, Colors.grey.shade500),
                              _subHeading('OMR 0.00000', 1.8, Colors.black,
                                  FontWeight.w600),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // SfSparkBarChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
