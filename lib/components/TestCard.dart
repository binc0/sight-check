import 'package:flutter/material.dart';

// This Widget is a placeholder for upcoming tests
class TestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // The grey and thin look makes it less clickable
      child: Card(
        color: Theme.of(context).unselectedWidgetColor,
        child: SizedBox(
          height: 160, // The width adapts automatically to the device width
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("More coming soon!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34.0,
                        fontWeight: FontWeight.w200)),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        // Clicking on this widget opens a dialog
        showDialog(
          context: context,
          child: new SimpleDialog(
            title: new Text('Title'),
            children: <Widget>[
              Text(
                  "loremkl jsdf lksjdfklsdjflksdfj l s.djflksdjf flsdkj sdlkf"),
              new SimpleDialogOption(
                child: new Text('Thanks!'),
              ),
            ],
          ),
        );
      },
    );
  }
}
