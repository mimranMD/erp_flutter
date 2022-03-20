import 'package:flutter/material.dart';

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
        color: Colors.yellow,
        width: deviceWidth,
        height: deviceHeight,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          children: const [
            DashboardCardsWidget(
              cardName: 'Users',
              cardImage: 'assets/dash/dash_img_01.png',
            ),
            DashboardCardsWidget(
              cardName: 'Users',
              cardImage: 'assets/dash/dash_img_01.png',
            ),
            DashboardCardsWidget(
              cardName: 'Users',
              cardImage: 'assets/dash/dash_img_01.png',
            ),
            DashboardCardsWidget(
              cardName: 'Users',
              cardImage: 'assets/dash/dash_img_01.png',
            ),
            DashboardCardsWidget(
              cardName: 'Users',
              cardImage: 'assets/dash/dash_img_01.png',
            ),
            DashboardCardsWidget(
              cardName: 'Users',
              cardImage: 'assets/dash/dash_img_01.png',
            ),
            DashboardCardsWidget(
              cardName: 'Users',
              cardImage: 'assets/dash/dash_img_01.png',
            ),
            DashboardCardsWidget(
              cardName: 'Users',
              cardImage: 'assets/dash/dash_img_01.png',
            ),
          ],
        ),
      ),
    );
  }
}
