import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";

  void _buttonPressed(String value) {
    setState(() {
      if (value == "=") {
        try {
          _output = _calculate(_output);
        } catch (e) {
          _output = "Erro";
        }
      } else if (value == "C") {
        _output = "0";
      } else {
        if (_output == "0") {
          _output = value;
        } else {
          _output += value;
        }
      }
    });
  }

  String _calculate(String expression) {
    try {
      // Substituir operadores matemáticos por símbolos padrão
      final formattedExpression = expression
          .replaceAll('÷', '/')
          .replaceAll('×', '*');
      final expressionToEvaluate = Expression.parse(formattedExpression);
      final evaluator = const ExpressionEvaluator();
      final result = evaluator.eval(expressionToEvaluate, {});
      return result.toString();
    } catch (e) {
      return "Erro";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 0, 0),
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: const Color.fromARGB(255, 35, 241, 141),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("÷"),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("×"),
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
              _buildButton("C"),
              _buildButton("0"),
              _buildButton("="),
              _buildButton("+"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
