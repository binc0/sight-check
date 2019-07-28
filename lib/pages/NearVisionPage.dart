import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sight_check/ChartModel.dart';
import 'package:sight_check/components/DistanceCard.dart';
import 'package:sight_check/components/EyeCard.dart';
import 'package:sight_check/components/ResultCard.dart';
import 'package:sight_check/components/TestCard.dart';

class NearVisionPage extends StatefulWidget {
  NearVisionPage({Key key}) : super(key: key);

  _NearVisionPageState createState() => _NearVisionPageState();
}

class _NearVisionPageState extends State<NearVisionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: const Text("Sight-Check")),
      body: ScopedModel<ChartModel>(
        model: new ChartModel(),
        child: ScopedModelDescendant<ChartModel>(
          builder: (context, child, model) => PageView(
            controller: model.controller,
            scrollDirection: Axis.horizontal,
            physics: new NeverScrollableScrollPhysics(),
            children: <Widget>[
              // I will have to read some documentation to remove that spaghetti code..
              DistanceCard(model),
              ResultCard(model),
              EyeCard("left", model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              EyeCard("right", model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              TestCard(model),
              ResultCard(model),
            ],
          ),
        ),
      ),
    );
  }
}
