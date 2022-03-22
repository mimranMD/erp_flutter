import '../financialDashboard/financial_dashboard.dart';
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 120,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Image.asset('assets/dash/logo.png', width: deviceWidth * .8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/dash/menu.png', width: 30),
                const Text(
                  "Dashboard Home",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0D1F3C),
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          decoration: BoxDecoration(
            color: Colors.amber.shade300,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: deviceHeight * 0.03),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.6 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dashboardImageModel.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FinancialDashBoard(),
                            ),
                          );
                        },
                        child: DashboardCardsWidget(
                          cardName: dashboardTextModel[index],
                          cardImage: dashboardImageModel[index]['img'],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
