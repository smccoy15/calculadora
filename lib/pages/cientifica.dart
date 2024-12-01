import 'dart:math';
import 'package:flutter/material.dart';

class ScientificCalculator extends StatefulWidget {
  @override
  _ScientificCalculatorState createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
  String _output = "0";

  void _buttonPressed(String label) {
    setState(() {
      switch (label) {
        case "C":
          _output = "0";
          break;
        case "sin":
          _output = sin(double.parse(_output) * pi / 180).toString();
          break;
        case "cos":
          _output = cos(double.parse(_output) * pi / 180).toString();
          break;
        case "tan":
          _output = tan(double.parse(_output) * pi / 180).toString();
          break;
        case "√":
          _output = sqrt(double.parse(_output)).toString();
          break;
        case "^2":
          _output = (pow(double.parse(_output), 2)).toString();
          break;
        default:
          // Concatenar dígitos
          if (_output == "0" || _output.isEmpty) {
            _output = label;
          } else {
            _output += label;
          }
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(text),
        child: Text(text, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora Científica")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(_output, style: TextStyle(fontSize: 30)),
            ),
          ),
          Column(
            children: [
              Row(children: ["7", "8", "9", "C"].map(_buildButton).toList()),
              Row(children: ["4", "5", "6", "sin"].map(_buildButton).toList()),
              Row(children: ["1", "2", "3", "cos"].map(_buildButton).toList()),
              Row(children: ["0", "^2", "√", "tan"].map(_buildButton).toList()),
            ],
          ),
        ],
      ),
    );
  }
}
