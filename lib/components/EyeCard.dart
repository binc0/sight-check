import 'package:flutter/material.dart';
import 'package:sight_check/ChartModel.dart';

class EyeCard extends StatelessWidget {
  EyeCard(this.eye, this.model);

  final String eye;
  final ChartModel model;
  var emojiMap = {"left": 6.0, "right": 16.0};

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Please close your ${this.eye} eye",
              style: TextStyle(fontSize: 24, fontFamily: 'OpenSans'),
            ),
            Transform(
              transform: Matrix4.identity()..rotateY(emojiMap[this.eye]),
              alignment: FractionalOffset.center,
              child: CircleAvatar(
                backgroundImage:
                    ExactAssetImage("assets/graphics/cool-kid.jpg"),
                radius: 140,
              ),
            ),
            MaterialButton(
              child: Text(
                "Next".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              color: Colors.lightBlueAccent[700],
              padding:
                  EdgeInsets.only(top: 16, right: 64, bottom: 16, left: 64),
              shape: StadiumBorder(),
              onPressed: () {
                model.nextPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
