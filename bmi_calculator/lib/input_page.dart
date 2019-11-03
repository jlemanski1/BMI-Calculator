import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: MainPageCard(
                colour: Color(0xFF1D1E33),
                ),
              ),
              Expanded(child: MainPageCard(
                colour: Color(0xFF1D1E33),
                ),
              ),
            ],
          )),
          Expanded(child: MainPageCard(
                colour: Color(0xFF1D1E33),
                ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: MainPageCard(
                colour: Color(0xFF1D1E33),
                ),
              ),
              Expanded(child: MainPageCard(
                colour: Color(0xFF1D1E33),
                ),
              ),
            ],),
          ),
        ],
      )
    );
  }
}


class MainPageCard extends StatelessWidget {
  Color colour;

  MainPageCard({@required this.colour});  //Require Colour param

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
        ),
      );
  }
}
