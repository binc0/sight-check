import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sight_check/AppLocalizations.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramButton extends StatelessWidget {
  const InstagramButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(FontAwesomeIcons.instagram, color: Colors.white),
          Container(
            width: 16,
          ),
          Text(
            AppLocalizations.of(context).translate('follow-us').toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
      color: Color(0xffe4405f),
      padding: EdgeInsets.only(top: 16, right: 64, bottom: 16, left: 64),
      shape: StadiumBorder(),
      onPressed: () {
        _launchURL();
      },
    );
  }

  _launchURL() async {
    const url = "https://instagram.com/sightcheck.app";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
