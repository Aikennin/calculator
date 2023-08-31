import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(_output);
      operand = buttonText;
      _output = "";
    } else if (buttonText == "=") {
      num2 = double.parse(_output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output += buttonText;
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          _buttonPressed(buttonText);
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff),
          padding: EdgeInsets.all(24.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xffb8c0ff),
      ),
      backgroundColor: Color(0xffb8c0ff),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 58.0, color: Colors.white),
              ),
            ),
          ),
          Divider(height: 0.0, color: Color(0xffb8c0ff)),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("x"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("."),
                  _buildButton("0"),
                  _buildButton("C"),
                  _buildButton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
