import 'package:flutter/material.dart';

import '../../Models/m_dashboard_img.dart';
import '../../Widgets/r_dashboard_cards.dart';

class DashboardPageMain extends StatefulWidget {
  const DashboardPageMain({Key? key}) : super(key: key);

  @override
  State<DashboardPageMain> createState() => _DashboardPageMainState();
}

class _DashboardPageMainState extends State<DashboardPageMain> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.amber.shade300,
        width: deviceWidth,
        height: deviceHeight,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.3 / 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemCount: dashboardImageModel.length,
          itemBuilder: (BuildContext context, index) {
            return DashboardCardsWidget(
              cardName: dashboardTextModel[index],
              cardImage: dashboardImageModel[index]['img'],
            );
          },
        ),
      ),
    );
  }
}
