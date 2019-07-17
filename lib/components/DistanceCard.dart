import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:sight_check/ChartModel.dart';

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
                "Choose distance to device",
                style: TextStyle(fontSize: 24, fontFamily: 'OpenSans'),
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
            max: 60,
            min: 30,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              setState(() {
                widget.model.distance = lowerValue;
              });
            },
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
            padding: EdgeInsets.only(top: 16, right: 64, bottom: 16, left: 64),
            shape: StadiumBorder(),
            onPressed: () {
              widget.model.nextPage();
            },
          ),
        ],
      ),
    ));
  }
}
