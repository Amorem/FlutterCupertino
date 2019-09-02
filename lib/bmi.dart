import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino/util.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('BMI'),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height * 0.8),
            child: Column(children: <Widget>[
              Image.network('https://bit.ly/img_bmi'),
              Util.paddingTop,
              Row(
                children: <Widget>[
                  Util.paddingLeft,
                  Container(width: width / 3, child: Text('Height')),
                  Expanded(
                    child: CupertinoTextField(),
                  ),
                  Util.paddingLeft,
                ],
              ),
              Util.paddingTop,
              Row(
                children: <Widget>[
                  Util.paddingLeft,
                  Container(
                    child: Text('Weight'),
                    width: width / 3,
                  ),
                  Expanded(
                    child: CupertinoTextField(),
                  ),
                  Util.paddingLeft,
                ],
              ),
              Expanded(child: Util.paddingTop),
              CupertinoButton.filled(
                child: Text('Calculate BMI'),
                onPressed: () {},
              ),
              Util.paddingTop,
            ]),
          ),
        ),
      ),
    );
  }
}
