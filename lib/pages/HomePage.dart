import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sight_check/ChartModel.dart';
import 'package:sight_check/components/DistanceCard.dart';
import 'package:sight_check/components/EyeCard.dart';
import 'package:sight_check/components/IntroCard.dart';
import 'package:share/share.dart';
import 'package:launch_review/launch_review.dart';
import 'package:sight_check/components/PopupMenu.dart';
import 'package:sight_check/components/TestCard.dart';

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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text("Sight-Check"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.smileBeam),
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
            height: MediaQuery.of(context).size.height * 0.7,
            child: ScopedModel<ChartModel>(
              model: new ChartModel(),
              child: ScopedModelDescendant<ChartModel>(
                builder: (context, child, model) => PageView(
                  controller: model.controller,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    IntroCard(model),
                    DistanceCard(model),
                    EyeCard("left", model),
                    TestCard(model),
                    EyeCard("right", model),
                    TestCard(model),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
