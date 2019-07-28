import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:sight_check/ChartModel.dart';
import 'package:sight_check/AppLocalizations.dart';

class DistanceCard extends StatefulWidget {
  DistanceCard(this.model);
  ChartModel model;

  @override
  _DistanceState createState() => _DistanceState();
}

class _DistanceState extends State<DistanceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translate('distance-description'),
                style: TextStyle(fontSize: 24, fontFamily: 'OpenSans'),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 8,
              ),
              Text(
                "${widget.model.distance} cm (${(widget.model.distance / 2.54).toStringAsFixed(2)} in)",
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
          FlutterSlider(
            values: [widget.model.distance],
            max: 50,
            min: 25,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              setState(() {
                widget.model.distance = lowerValue;
              });
            },
          ),
          MaterialButton(
            child: Text(
              AppLocalizations.of(context).translate('next').toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            color: Colors.lightBlueAccent[700],
            padding: EdgeInsets.only(top: 16, right: 64, bottom: 16, left: 64),
            shape: StadiumBorder(),
            onPressed: () {
              widget.model.setHeight(MediaQuery.of(context).devicePixelRatio);
              widget.model.nextPage();
            },
          ),
        ],
      ),
    ));
  }
}
