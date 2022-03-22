import 'package:erp_flutter/Views/financialDashboard/financial_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Image.asset('assets/dash/logo.png' ,width: deviceWidth* .8),
          bottom: PreferredSize(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: deviceWidth * .08,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/dash/menu.png',
                          width: 30, height: 30),
                          SizedBox(width: deviceWidth * .12,),
                      const Text(
                        "Dashboard Home",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff0D1F3C)),
                      ),
                      SizedBox(height: deviceHeight * 0.05,)
                    ],
                  )),
              preferredSize: const Size.fromHeight(80)),
        ),
      ),
      body: SafeArea(
        child: Container(
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
              return GestureDetector(
                onTap: (){
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FinancialDashBoard()),
                      );
                },
                child: DashboardCardsWidget(
                  cardName: dashboardTextModel[index],
                  cardImage: dashboardImageModel[index]['img'],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
