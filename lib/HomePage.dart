import 'package:flutter/material.dart';
import 'package:sight_check/components/IntroCard.dart';
import 'package:share/share.dart';
import 'package:launch_review/launch_review.dart';
import 'package:sight_check/components/PopupMenu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sight-Check"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              LaunchReview.launch(
                  androidAppId: "com.michaeljancen.sight_check",
                  iOSAppId: "585027354");
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                  'Hi, I used this app to check my eyesight and you can do it too https://sightcheck.de');
            },
          ),
          PopupMenu(),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                IntroCard(),
                IntroCard(),
                IntroCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
