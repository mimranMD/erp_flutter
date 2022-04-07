import 'package:erp_flutter/Views/home/profit_screen.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
        title: Image.asset(
          'assets/dash/logo.png',
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
                      ),
                    ],
                  ),
                ),
      //             StackedBarChart(  seriesList,
      // animate: animate,)
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
class StackedBarChart extends StatelessWidget {
final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  // ignore: use_key_in_widget_constructors
  const StackedBarChart( this.seriesList, {required this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedBarChart.withSampleData() {
    return  StackedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return  charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      OrdinalSales('2014', 5),
       OrdinalSales('2015', 25),
       OrdinalSales('2016', 100),
       OrdinalSales('2017', 75),
    ];

    final tableSalesData = [
       OrdinalSales('2014', 25),
       OrdinalSales('2015', 50),
       OrdinalSales('2016', 10),
       OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
       OrdinalSales('2014', 10),
       OrdinalSales('2015', 15),
       OrdinalSales('2016', 50),
       OrdinalSales('2017', 45),
    ];

    return [
       charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}