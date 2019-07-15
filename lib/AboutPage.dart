import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/graphics/work.svg",
                semanticsLabel: 'Acme Logo',
                height: 200,
              ),
              Container(
                height: 32,
              ),
              Text(
                "I really enjoyed developing this Sight-Check for over a year and helping thousands of people! As you can see I decided not to include ads or fees, because I don't see the point in monetizing something essential as helathcare at your costs.\n\nThat's why I open-sourced the code, which means the code is free for everyone to use and explore. Follow Sight-Check on Instagram to suggest features or participate in making Sight-Check better, by visiting our project at Github.",
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
      ),
    );
  }
}
