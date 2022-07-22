import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text('Calculator'),
        ),
        body:  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                  child: Container(
                    //padding: EdgeInsets.all(10.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                      ),
                    ),
                  ),
              Row(
                children: <Widget>[
                  customOutlinedButton("9"),
                  customOutlinedButton("8"),
                  customOutlinedButton("7"),
                  customOutlinedButton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  customOutlinedButton("6"),
                  customOutlinedButton("5"),
                  customOutlinedButton("4"),
                  customOutlinedButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  customOutlinedButton("3"),
                  customOutlinedButton("2"),
                  customOutlinedButton("1"),
                  customOutlinedButton("x"),
                ],
              ),
              Row(
                children: <Widget>[
                  customOutlinedButton("C"),
                  customOutlinedButton("0"),
                  customOutlinedButton("="),
                  customOutlinedButton("/"),
                ],
              ),
           ],
         ),
     ),
    );
  }


  Widget customOutlinedButton(String val) {

    return Expanded(

      child: ElevatedButton(
        //padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 35.0, color: Colors.white),
        ),
      ),
    );
  }


  late int first, second;
  late String res, text = "";
  late String opp;
  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
      } else if (btnText == "+" ||
    btnText == "-" ||
    btnText == "x" ||
    btnText == "/" ) {
      first = int.parse(text);
      res = "";
      opp = btnText;
      } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+"){
        res = (first + second).toString();
      }
      if (opp == "-"){
        res = (first - second).toString();
      }
      if (opp == "x"){
        res = (first * second).toString();
      }
      if (opp == "/"){
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }

    setState(() {
      text = res;
    });
  }
}

