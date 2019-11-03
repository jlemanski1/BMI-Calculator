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
              Expanded(child: MainPageCard(),
              ),
              Expanded(child: MainPageCard(),
              ),
            ],
          )),
          Expanded(child: MainPageCard(),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: MainPageCard(),
              ),
              Expanded(child: MainPageCard(),
              ),
            ],),
          ),
        ],
      )
    );
  }
}


class MainPageCard extends StatelessWidget {
  const MainPageCard({
    Key key,
  }) : super(key: key);

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
