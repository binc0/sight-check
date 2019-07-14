import 'package:flutter/material.dart';
import 'package:sight_check/AboutPage.dart';
import 'package:sight_check/PolicyPage.dart';
import 'package:sight_check/TermsPage.dart';
import 'package:sight_check/components/Constants.dart';

class PopupMenu extends StatefulWidget {
  PopupMenu({Key key}) : super(key: key);

  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton<String>(
        onSelected: choiceAction,
        icon: Icon(
          Icons.more_vert,
        ),
        itemBuilder: (BuildContext context) {
          return Constants.choices.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.About) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutPage()),
      );
    } else if (choice == Constants.Terms) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TermsPage()),
      );
    } else if (choice == Constants.Policy) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PolicyPage()),
      );
    } else if (choice == Constants.Licenses) {
      showLicensePage(context: context);
    }
  }
}
