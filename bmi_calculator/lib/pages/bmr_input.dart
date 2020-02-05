import 'package:bmi_calculator/components/measure.dart';
import 'package:flutter/material.dart';

class BMRInputPage extends StatefulWidget {
  @override
  _BMRInputPageState createState() => _BMRInputPageState();
}

class _BMRInputPageState extends State<BMRInputPage> {
  Measurement selectedMeasure = Measurement.metric;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ezBMR',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[

            ],
          ),
          ),
        ],
      ),
    );
  }
}