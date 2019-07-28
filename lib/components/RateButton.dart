import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
import 'package:sight_check/AppLocalizations.dart';

class RateButton extends StatelessWidget {
  const RateButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(FontAwesomeIcons.smileBeam, color: Colors.white),
          Container(
            width: 16,
          ),
          Text(
            AppLocalizations.of(context).translate('rate-us').toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(top: 16, right: 64, bottom: 16, left: 64),
      shape: StadiumBorder(),
      onPressed: () {
        LaunchReview.launch(
            androidAppId: "com.michaeljancen.sight_check",
            iOSAppId: "1473118871");
      },
    );
  }
}
