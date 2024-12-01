import 'package:flutter/material.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String _output = "0";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _output = ""; // Preparamos para recibir el segundo número
      } else if (buttonText == "=") {
        _num2 = double.parse(_output);
        switch (_operand) {
          case "+":
            _output = (_num1 + _num2).toString();
            break;
          case "-":
            _output = (_num1 - _num2).toString();
            break;
          case "x":
            _output = (_num1 * _num2).toString();
            break;
          case "/":
            _output = _num2 != 0 ? (_num1 / _num2).toString() : "Error";
            break;
        }
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      } else {
        // Concatenar dígitos
        if (_output == "0" || _output.isEmpty) {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(text),
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora Normal")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(_output, style: TextStyle(fontSize: 40)),
            ),
          ),
          Column(
            children: [
              Row(children: ["7", "8", "9", "/"].map(_buildButton).toList()),
              Row(children: ["4", "5", "6", "x"].map(_buildButton).toList()),
              Row(children: ["1", "2", "3", "-"].map(_buildButton).toList()),
              Row(children: ["C", "0", "=", "+"].map(_buildButton).toList()),
            ],
          ),
        ],
      ),
    );
  }
}
