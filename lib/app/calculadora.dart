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
    //Função para reconhecer o texto do botão selecionado
    setState(() {
      //Notifica que o widget está sendo alterado e precisa de reconstrução
      if (buttonText == '=') {
        //Valida se o botão selecionado é "="
        if (_currentOperator.isNotEmpty && _input.isNotEmpty) {
          //Valida se tem um operador e um valor sendo inserido antes do "="
          double currentValue = double.parse(
              _input); //Converte a string (valor de entrada) para double
          switch (_currentOperator) {
            case '+':
              _result = _previousValue + currentValue; //Realiza operação
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
          _input = _result.toStringAsFixed(
              2); //Atualiza input com o resultado da operação anterior e formata o valor com ","
          _currentOperator =
              ''; //String vazia = Não tem nenhum operador selecionado
          _currentOperationText = ''; //Exibe o operador selecionado atual
          _previousValue = _result; // Atualiza o valor anterior com o resultado
        }
      } else if (buttonText == 'C') {
        //Limpar operação
        _input = '';
        _result = 0.0;
        _currentOperator = '';
        _currentOperationText = '';
        _previousValue = 0.0;
      } else if (_isOperator(buttonText)) {
        //Se um botão de operador for selecionado
        if (_input.isNotEmpty) {
          //Valida se a entrada não é vazia
          _previousValue = double.parse(
              _input); //Converte a string (valor de entrada) para double
          _input = ''; //Limpa a entrada anterior para receber nova
        }
        _currentOperator = buttonText; //Armazena o operador pressionado
        _currentOperationText = buttonText; //Define o texto do operador atual
      } else {
        //Se o botão selecionado NÂO for um operador
        _input += buttonText; //Adiciona texto para permitir que novas entradas
      }
    });
  }

  bool _isOperator(String buttonText) {
    //Verifica se o valor inserido é um operador
    return buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/';
  }

  Widget _buildButton(String buttonText, Color color) {
    //Interface com botões
    return Expanded(
      //Distribui os botões uniformemente
      child: ElevatedButton(
        //Sombra no botão pressionado
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(30.0),
          textStyle: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          //Quando botão pressionado
          _handleButtonPress(buttonText); //Chama função
        },
        child: Text(buttonText), //Texto aparece no botão
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora online')), //Barra superior
      drawer: Menu(context), //Chama menu
      body: Column(
        children: [
          Expanded(
            child: Container(
              //Define os botões, estilo e ordem
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
