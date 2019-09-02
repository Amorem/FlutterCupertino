import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino/util.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController heightController;
  TextEditingController weightController;
  int unit;

  @override
  Widget build(BuildContext context) {
    heightController = TextEditingController();
    weightController = TextEditingController();
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
                    child: CupertinoTextField(
                      controller: heightController,
                    ),
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
                    child: CupertinoTextField(
                      controller: weightController,
                    ),
                  ),
                  Util.paddingLeft,
                ],
              ),
              Expanded(child: Util.paddingTop),
              CupertinoButton.filled(
                child: Text('Calculate BMI'),
                onPressed: () {
                  showResult();
                },
              ),
              Util.paddingTop,
            ]),
          ),
        ),
      ),
    );
  }

  void showResult() async {
    double height = double.tryParse(heightController.text);
    double weight = double.tryParse(weightController.text);
    int unit = await Util.getSettings();
    double result = Util.calculateBMI(height, weight, unit);
    String message = 'Your BMI is ' + result.toStringAsFixed(2);
    CupertinoAlertDialog dialog = CupertinoAlertDialog(
      title: Text("Results"),
      content: Text(message),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
