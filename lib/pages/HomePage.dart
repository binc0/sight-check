import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:launch_review/launch_review.dart';
import 'package:sight_check/AppLocalizations.dart';
import 'package:sight_check/components/IntroCard.dart';
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text("Sight-Check"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.smileBeam),
            onPressed: () {
              LaunchReview.launch(
                  androidAppId: "com.michaeljancen.sight_check",
                  iOSAppId: "1473118871");
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(AppLocalizations.of(context).translate('share-text'));
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
            child: IntroCard(),
          ),
        ),
      ),
    );
  }
}
