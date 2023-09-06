import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/menu.dart';
import 'home.dart';
import 'formulario.dart';

class Calculadora extends StatelessWidget {
  @override //Substitui método da classe pai
  Widget build(BuildContext context) {
    //Define estrutura e recebe objeto
    return MaterialApp(
      //Widget padrão para criar app
      title: 'Calculadora online',
      theme: ThemeData(primarySwatch: Colors.purple), //Tema/cor do app
      home:
          DisplayCalculadora(), //Roda a aplicação da calculadra quando for iniciado
    );
  }
}

class DisplayCalculadora extends StatefulWidget {
  //Cria nova classe
  const DisplayCalculadora({Key? key}) : super(key: key); //Contrututor

  @override
  State<DisplayCalculadora> createState() => _DisplayCalculadoraState();
}

class _DisplayCalculadoraState extends State<DisplayCalculadora> {
  String _input = '';
  double _result = 0.0;
  String _currentOperator = '';
  String _currentOperationText = '';
  double _previousValue = 0.0;

  void _handleButtonPress(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        if (_currentOperator.isNotEmpty && _input.isNotEmpty) {
          double currentValue = double.parse(_input);
          switch (_currentOperator) {
            case '+':
              _result = _previousValue + currentValue;
              break;
            case '-':
              _result = _previousValue - currentValue;
              break;
            case '*':
              _result = _previousValue * currentValue;
              break;
            case '/':
              _result = _previousValue / currentValue;
              break;
          }
          _input = _result.toStringAsFixed(2);
          _currentOperator = '';
          _currentOperationText = '';
          _previousValue = _result; // Atualiza o valor anterior com o resultado
        }
      } else if (buttonText == 'C') {
        _input = '';
        _result = 0.0;
        _currentOperator = '';
        _currentOperationText = '';
        _previousValue = 0.0;
      } else if (_isOperator(buttonText)) {
        if (_input.isNotEmpty) {
          _previousValue = double.parse(_input);
          _input = '';
        }
        _currentOperator = buttonText;
        _currentOperationText = buttonText;
      } else {
        _input += buttonText;
      }
    });
  }

  bool _isOperator(String buttonText) {
    return buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/';
  }

  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(30.0),
          textStyle: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          _handleButtonPress(buttonText);
        },
        child: Text(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora online')),
      drawer: Menu(context),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _currentOperationText,
                    style: TextStyle(fontSize: 18.0, color: Colors.deepPurple),
                  ),
                  Text(
                    _input,
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('C', Colors.grey),
              _buildButton('=', Colors.blueAccent),
              _buildButton('0', Colors.purpleAccent),
              _buildButton('/', Colors.deepPurple),
            ],
          ),
          Row(
            children: [
              _buildButton('7', Colors.purpleAccent),
              _buildButton('8', Colors.purpleAccent),
              _buildButton('9', Colors.purpleAccent),
              _buildButton('*', Colors.deepPurple),
            ],
          ),
          Row(
            children: [
              _buildButton('4', Colors.purpleAccent),
              _buildButton('5', Colors.purpleAccent),
              _buildButton('6', Colors.purpleAccent),
              _buildButton('-', Colors.deepPurple),
            ],
          ),
          Row(
            children: [
              _buildButton('1', Colors.purpleAccent),
              _buildButton('2', Colors.purpleAccent),
              _buildButton('3', Colors.purpleAccent),
              _buildButton('+', Colors.deepPurple),
            ],
          ),
        ],
      ),
    );
  }
}
