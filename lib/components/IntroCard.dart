import 'package:flutter/material.dart';
import 'TestCard.dart';

// This Widget is used to route to the near vision diagnosis page
class IntroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Looks like a big button to support people with poor vision
      child: Card(
        child: SizedBox(
          height: 500,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(), // spacing to center the image
                Image.asset(
                  'assets/graphics/health.png',
                  fit: BoxFit.contain,
                  height: 300,
                ),
                Container(
                  height: 80,
                  color: Colors.lightBlue,
                  child: SizedBox.expand(
                    child: Center(
                      child: Text(
                        "Start",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
