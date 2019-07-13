import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: Text(
            "Sight-Check is an app that checks your eyesight for free. I really enjoyed developing this app and helping hundreds of thousands of people! As you can see I decided not to include ads or fees, because I don't see the point in monetizing something essential as helathcare at your costs. Please follow Sight-Check (https://instagram.com/sightcheck.app) on Instagram to suggest features or submit technical errors. You can also participate in developing Sight-Check, have a look at our code: https://github.com/jancen-widmer/sight_check"),
      ),
    );
  }
}
