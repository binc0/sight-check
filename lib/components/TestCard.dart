import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sight_check/ChartModel.dart';
import 'dart:math' as math;

class TestCard extends StatefulWidget {
  ChartModel model;
  TestCard(this.model);

  @override
  _TestCardState createState() => _TestCardState();
}

class _TestCardState extends State<TestCard> {
  Offset defaultPosition = Offset(150, 150); // Local center point
  Offset center = Offset(200, 150); // Default shape orientation
  Offset newPosition = Offset(200, 150); // New shape orientation
  double rotation = 0.0; // Angle between default and new orientation

/**
 * The landolt C has different rotations / positions.
 * The current rotation position for example (1) can be determined by checking 
 * whether the value is between the first and second range item
 */
  static const List<double> ranges = [
    (13 * math.pi / 8),
    (15 * math.pi / 8),
    (1 * math.pi / 8),
    (3 * math.pi / 8),
    (5 * math.pi / 8),
    (7 * math.pi / 8),
    (9 * math.pi / 8),
    (11 * math.pi / 8),
  ];
  static const List<double> rotations = [
    (12 * math.pi / 8),
    (14 * math.pi / 8),
    (16 * math.pi / 8),
    (2 * math.pi / 8),
    (4 * math.pi / 8),
    (6 * math.pi / 8),
    (8 * math.pi / 8),
    (10 * math.pi / 8),
  ];
  int currentPosition = 2; // Set the default shape orientation
  int previousPosition; // Remember the previous position so that the Widget knows when to update state
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
                  height: widget.model.ringHeight,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                color: Colors.grey[500],
                child: GestureDetector(
                  child: Transform.rotate(
                    alignment: FractionalOffset.center,
                    angle: rotation,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/graphics/dots.svg",
                          height: widget.model.ringHeight,
                        ),
                        SvgPicture.asset(
                          "assets/graphics/test-ring.svg",
                          height: widget.model.ringHeight,
                        ),
                      ],
                    ),
                  ),
                  onScaleUpdate: (updateDetails) {
                    Offset updatedPosition = updateDetails.localFocalPoint;
                    double newRotation = calculateAngle(updatedPosition);
                    previousPosition = currentPosition;
                    // Position 0 (top)
                    if (newRotation >= ranges[7] && newRotation <= ranges[0]) {
                      currentPosition = 0;
                    }
                    // Position 1 (top right)
                    else if (newRotation >= ranges[0] &&
                        newRotation <= ranges[1]) {
                      currentPosition = 1;
                    }
                    // Position 2 (right)
                    else if (newRotation >= ranges[1] ||
                        newRotation <= ranges[2]) {
                      currentPosition = 2;
                    }
                    // Position 3 (bottom right)
                    else if (newRotation >= ranges[2] &&
                        newRotation <= ranges[3]) {
                      currentPosition = 3;
                    }
                    // Position 4 (bottom)
                    else if (newRotation >= ranges[3] &&
                        newRotation <= ranges[4]) {
                      currentPosition = 4;
                    }
                    // Position 5 (bottom left)
                    else if (newRotation >= ranges[4] &&
                        newRotation <= ranges[5]) {
                      currentPosition = 5;
                    }
                    // Position 6 (left)
                    else if (newRotation >= ranges[5] &&
                        newRotation <= ranges[6]) {
                      currentPosition = 6;
                    }
                    // Position 7 (top left)
                    else if (newRotation >= ranges[6] &&
                        newRotation <= ranges[7]) {
                      currentPosition = 7;
                    }
                    // Update state only when the positon exceeds a range
                    if (previousPosition != currentPosition) {
                      setState(() => rotation = rotations[currentPosition]);
                    }
                  },
                  // onScaleEnd: (scaleEndDetails) {
                  //   _previousScale = null;
                  // },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Return radian between center, default and new localFocalPoint
  double calculateAngle(Offset updatedPosition) {
    double radian = (math.atan2(updatedPosition.dy - center.dy,
            updatedPosition.dx - defaultPosition.dx) -
        math.atan2(
            center.dy - defaultPosition.dy, center.dx - defaultPosition.dx));
    if (radian <= 0) {
      return radian + 2 * math.pi;
    } else {
      return radian;
    }
  }
}
