import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubButton extends StatelessWidget {
  const GithubButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(FontAwesomeIcons.github, color: Colors.white),
          Container(
            width: 16,
          ),
          Text(
            "Contribute".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
      color: Colors.black,
      padding: EdgeInsets.only(top: 16, right: 64, bottom: 16, left: 64),
      shape: StadiumBorder(),
      onPressed: () {
        _launchURL();
      },
    );
  }

  _launchURL() async {
    const url = "https://github.com/jancen-widmer/sight-check";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
