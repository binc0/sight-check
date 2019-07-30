import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:sight_check/AppLocalizations.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(FontAwesomeIcons.shareAlt,
              color: Theme.of(context).primaryColor),
          Container(
            width: 16,
          ),
          Text(
            AppLocalizations.of(context).translate('share').toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 16, right: 64, bottom: 16, left: 64),
      shape: StadiumBorder(),
      onPressed: () {
        Share.share(AppLocalizations.of(context).translate('share-text'));
      },
    );
  }
}
