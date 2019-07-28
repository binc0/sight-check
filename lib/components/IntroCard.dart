import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen/screen.dart';
import 'package:sight_check/AppLocalizations.dart';
import 'package:sight_check/pages/NearVisionPage.dart';

// This Widget is a placeholder for upcoming tests
class IntroCard extends StatefulWidget {
  IntroCard({Key key}) : super(key: key);

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
    setupScreenBrightness();
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
                    AppLocalizations.of(context)
                        .translate('near-vision-diagnosis'),
                    style: TextStyle(fontSize: 24, fontFamily: 'OpenSans'),
                  ),
                  Container(
                    height: 8,
                  ),
                  Text(
                      AppLocalizations.of(context)
                          .translate('diagnosis-description'),
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.caption),
                  Container(
                    height: 32,
                  ),
                  MaterialButton(
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('start')
                          .toUpperCase(),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NearVisionPage()),
                      );
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

  setupScreenBrightness() async {
    // Get the current brightness
    double brightness = await Screen.brightness;

    // Set the brightness to at least 200 cd/m^2 (average value of todays mobile devices)
    if (brightness <= 0.6) {
      Screen.setBrightness(0.6);
    }
  }
}
