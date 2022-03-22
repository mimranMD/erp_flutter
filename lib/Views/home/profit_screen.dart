import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../Models/graph_model.dart';
class ProfitScreen extends StatefulWidget {
  const ProfitScreen({Key? key}) : super(key: key);

  @override
  State<ProfitScreen> createState() => _ProfitScreenState();
}

class _ProfitScreenState extends State<ProfitScreen> {
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
        title: Image.asset('assets/dash/logo.png', width: deviceWidth * .8),
      ),
      body: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Profit and Loss",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3E4958)),
                ),
                Container(
                  margin:  EdgeInsets.only(top:deviceHeight * .015, ),
                  height: deviceHeight * .06,
                  width: deviceWidth * .75,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                      border: Border.all(color: const Color(0xffD3D3D3))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: deviceHeight * .06,
                              width: deviceWidth * .13,
                              child: const Center(
                                child: Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3E4958)),
                                ),
                              ),
                            ),
                            Container(
                              height: deviceHeight * .06,
                              width: 01,
                              color: const Color(0xffD3D3D3),
                            ),
                            SizedBox(
                              width: deviceHeight * .02,
                            ),
                            Container(
                              height: deviceHeight * .045,
                              width: deviceWidth * .2,
                              decoration: const BoxDecoration(
                                color: Color(0xffEBEBD3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: const Center(
                                child: Text(
                                  "9 NOV 2019",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3E4958)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: deviceHeight * .06,
                          width: deviceWidth * .2,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6.0),
                                  bottomRight: Radius.circular(6.0)),
                              color: Color(0xffF5D547)),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.autorenew,
                                  color: const Color(0xff000000)
                                      .withOpacity(0.40),
                                ),
                                Container(
                                  height: deviceHeight * .06,
                                  width: 01,
                                  color: const Color(0xffB8B8B8),
                                ),
                                Icon(
                                  Icons.save_alt,
                                  color: const Color(0xff000000)
                                      .withOpacity(0.40),
                                ),
                              ]),
                        )
                      ]),
                ),
                  SizedBox(
                    height: deviceHeight * .5,
                    child: charts.BarChart(
                      _getSeriesData(), 
                      animate: true,
                      domainAxis: const charts.OrdinalAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(labelRotation: 60)
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
  _getSeriesData() {
    List<charts.Series<PopulationData, String>> series = [
      charts.Series(
        id: "Population",
        data: data,
        domainFn: (PopulationData series, _) => series.year.toString(),
        measureFn: (PopulationData series, _) => series.population,
        colorFn: (PopulationData series, _) => series.barColor
      )
    ];
    return series;
}
}
