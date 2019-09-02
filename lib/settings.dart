import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "util.dart";

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int unit = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final Map<int, Widget> systems = const <int, Widget>{
      0: Text('Decimal'),
      1: Text('Imperial')
    };
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Image.network('https://bit.ly/fl_earth'),
            Util.paddingTop,
            Row(
              children: <Widget>[
                SizedBox(
                  width: width,
                  child: CupertinoSegmentedControl(
                    children: systems,
                    groupValue: unit,
                    onValueChanged: (value) {
                      updateControl(value);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void updateControl(int value) {
    if (value != unit) {
      setState(() {
        unit = value;
      });
    }
  }
}
