import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sight_check/ChartModel.dart';

// This Widget is a placeholder for upcoming tests
class IntroCard extends StatefulWidget {
  IntroCard(this.model);
  ChartModel model;

  @override
  _IntroCardState createState() => _IntroCardState();
}

class _IntroCardState extends State<IntroCard>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    animation = Tween(begin: 0, end: 60).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SvgPicture.asset(
              "assets/graphics/doctor.svg",
              height: 200,
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Near Vision Diagnosis",
                    style: TextStyle(fontSize: 24, fontFamily: 'OpenSans'),
                  ),
                  Container(
                    height: 8,
                  ),
                  Text("This diagnosis will take about 5 minutes or less.",
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
                    onPressed: () {
                      widget.model.nextPage();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
