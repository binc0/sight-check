import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sight_check/AppLocalizations.dart';
import 'package:sight_check/components/GithubButton.dart';
import 'package:sight_check/components/InstagramButton.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('about')),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 16, right: 32, bottom: 32, left: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/graphics/work.svg",
                height: 200,
              ),
              Container(
                height: 32,
              ),
              Text(
                AppLocalizations.of(context).translate('about-text'),
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.body1,
              ),
              Container(
                height: 32,
              ),
              InstagramButton(),
              Container(
                height: 16,
              ),
              GithubButton(),
              Container(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
