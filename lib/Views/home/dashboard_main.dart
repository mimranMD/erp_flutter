import 'package:erp_flutter/Models/constants.dart';
import 'package:erp_flutter/Models/graph_model.dart';
import 'package:flutter/material.dart';

import '../../Models/dashboardmodel.dart';
import '../../Models/m_dashboard_img.dart';
import '../../Service/api_call.dart';
import '../../Widgets/r_dashboard_cards.dart';
import 'dashboard_detail.dart';

class DashboardPageMain extends StatefulWidget {
  final String lang;
  final String companyId;
  


  const DashboardPageMain({Key? key, required this.lang, required this.companyId}) : super(key: key);

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
          decoration: const BoxDecoration(
            color: Color(0xffa1852e),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: FutureBuilder<List<DashboardMain>?>(
                future: ApiCalls().dashboard("ALG",'Employee',1, 'en', 'general'),
                builder: (context, snapshot){
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator());
        }
                return Column(
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
                      itemCount: snapshot.data != null? snapshot.data!.length:0,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashboardDetailPage(),
                              ),
                            );
                          },
                          child: DashboardCardsWidget(
                            cardName: snapshot.data![index].screenName ?? "",
                            cardImage: dashboardImageModel[index]['img'],
                          ),
                        );
                      },
                    ),
                  ],
                );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
