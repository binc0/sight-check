import 'package:flutter/material.dart';
import 'TestCard.dart';

class IntroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Image Background
          Image.asset(
            'assets/graphics/background.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          // Blue Scrim for readability
          Container(color: Colors.lightBlueAccent.withOpacity(0.6)),
          // Text Container
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Near Vision Test",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34.0,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                ),
                Text("Your diagnosis will take about 5 minutes or less.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          // Start Button
          Container(
            height: 80,
            margin: EdgeInsets.all(16),
            child: Center(
              child: Text(
                "Start",
                style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.w500),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                    new TestCard())); // Clicking on this widget routes the app to the diagnosis page
      },
    );
  }
}
