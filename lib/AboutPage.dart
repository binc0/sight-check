import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sight_check/components/GithubButton.dart';
import 'package:sight_check/components/InstagramButton.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("About"),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Container(
        margin: EdgeInsets.only(left: 64, right: 64, bottom: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sight-Check is an app that checks your eyesight for free. I really enjoyed developing this app and helping hundreds of thousands of people! As you can see I decided not to include ads or fees, because I don't see the point in monetizing something essential as helathcare at your costs.\n\nFollow us on Instagram to suggest features or submit technical errors. You can also participate in making Sight-Check better, have a look at our project at Github.",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.body2,
            ),
            Container(
              height: 32,
            ),
            InstagramButton(),
            Container(
              height: 16,
            ),
            GithubButton(),
          ],
        ),
      ),
    );
  }
}
