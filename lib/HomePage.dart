import 'package:flutter/material.dart';
import 'components/IntroCard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(), // used for spacing
          Container(
              margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
              child: Text("Near Vision Diagnosis",
                  style:
                      TextStyle(fontSize: 34.0, fontWeight: FontWeight.w400))),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IntroCard(),
                  ],
                )
              ],
            ),
          ),
          Container(), // used for spacing
          Container(), // used for spacing
        ],
      ),
    );
  }
}
