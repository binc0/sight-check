import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sight_check/ChartModel.dart';
import 'dart:math' as math;

class TestCard extends StatelessWidget {
  TestCard(this.model);

  ChartModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Transform.rotate(
              angle: (math.pi),
              child: SvgPicture.asset(
                "assets/graphics/landolt-ring.svg",
                height: this.model.ringHeight,
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
