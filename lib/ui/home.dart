import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  String _calculatedBmi = "";
  String _bmiStatus = "";
  Color _bmiStatusColor = Colors.white;

  void calculate(){
    setState(() {
      double bmi = (int.parse(_weightController.text)*10000)/(int.parse(_heightController.text) * int.parse(_heightController.text));
      debugPrint(bmi.toString());
      _calculatedBmi = "Your BMI: ${bmi.toStringAsFixed(1)}";
      if(bmi < 18.5){
        _bmiStatus = "UnderWeight";
        _bmiStatusColor = Colors.pink;
      }else if(bmi < 25.0){
        _bmiStatus = "Normal";
        _bmiStatusColor = Colors.lightGreen;
      }else if(bmi < 30.0){
        _bmiStatus = "OverWeight";
        _bmiStatusColor = Colors.pink;
      }else{
        _bmiStatus = "Obese";
        _bmiStatusColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("BMI"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
              child: Center(
                child: new Image.asset(
                  "images/bmilogo.png",
                  scale: 1.5,
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
              color: Colors.black12,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: null,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "In Years",
                        icon: new Icon(Icons.person)),
                  ),
                  new Padding(padding: EdgeInsets.all(4.0)),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height",
                        hintText: "In Cms",
                        icon: new Icon(Icons.assessment)),
                  ),
                  new Padding(padding: EdgeInsets.all(4.0)),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight",
                        hintText: "In Kg",
                        icon: new Icon(Icons.calendar_view_day)),
                  ),
                  new Padding(padding: EdgeInsets.all(8.0)),
                  new RaisedButton(
                    onPressed: () => calculate(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                    child: new Container(
                      margin: EdgeInsets.all(12.0),
                      child: new Text(
                        "Calculate",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.all(8.0),
              child: new Center(
                child: new Text(
                  _calculatedBmi,
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400
                  ),
                ),
              )
            ),
            new Container(
                padding: EdgeInsets.all(4.0),
                child: new Center(
                  child: new Text(
                    _bmiStatus,
                    style: TextStyle(
                        color: _bmiStatusColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                )
            )
          ],
        ));
  }
}
