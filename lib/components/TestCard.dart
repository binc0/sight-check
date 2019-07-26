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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Transform.rotate(
                angle: (math.pi),
                child: SvgPicture.asset(
                  "assets/graphics/landolt-ring.svg",
                  height: this.model.ringHeight,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                color: Theme.of(context).accentColor,
                child: SvgPicture.asset(
                  "assets/graphics/test-ring.svg",
                  height: this.model.ringHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
