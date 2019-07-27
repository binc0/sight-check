import 'package:flutter/material.dart';
import 'package:sight_check/ChartModel.dart';
import 'package:sight_check/components/RateButton.dart';

class ResultCard extends StatelessWidget {
  ChartModel model;
  ResultCard(this.model);

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
              "Your result",
              style: Theme.of(context).textTheme.headline,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Left",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Right",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "${this.model.leftAcuity}%",
                      style: Theme.of(context).textTheme.display2,
                    ),
                    Text(
                      "${this.model.rightAcuity}%",
                      style: Theme.of(context).textTheme.display2,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                RateButton(),
                Container(
                  height: 32,
                ),
                Text(
                  "This app can not replace a medical advice.",
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
