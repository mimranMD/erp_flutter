import 'dart:html';

import 'package:flutter/material.dart';

class DashboardCardsWidget extends StatelessWidget {
  final String cardName;
  final ImageData cardImage;

  const DashboardCardsWidget(
      {Key? key, required this.cardName, required this.cardImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: cardName.toUpperCase(),
                  style: const TextStyle(
                      letterSpacing: 10.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
