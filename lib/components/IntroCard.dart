import 'package:flutter/material.dart';

// This Widget is a placeholder for upcoming tests
class IntroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // The grey and thin look makes it less clickable
      child: Card(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  "assets/graphics/health.png",
                  fit: BoxFit.contain,
                ),
                flex: 1,
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Near Vision Diagnosis",
                          style:
                              TextStyle(fontSize: 24, fontFamily: 'OpenSans'),
                        ),
                        Container(
                          height: 8,
                        ),
                        Text(
                            "This diagnosis will take about 5 minutes or less.",
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.caption),
                        Container(
                          height: 32,
                        ),
                        MaterialButton(
                          child: Text(
                            "Start".toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          color: Colors.lightBlueAccent[700],
                          padding: EdgeInsets.only(
                              top: 16, right: 64, bottom: 16, left: 64),
                          shape: StadiumBorder(),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
            ],
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
              Text("loremkl"),
              new SimpleDialogOption(
                child: new Text('Thank you!'),
              ),
            ],
          ),
        );
      },
    );
  }
}
