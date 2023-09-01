import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/menu.dart';
import 'home.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  String _nome = '';
  String _telefone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(context), //Chama menu
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha à esquerda
          children: [
            //NOME
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 16.0),

            //TELEFONE
            TextField(
              controller: _telefoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _nome = _nomeController.text;
                  _telefone = _telefoneController.text;
                });
              },

              //BOTÃO ENVIAR
              style: ElevatedButton.styleFrom(
                primary: Color(0xffbe8fe5),
                onPrimary: Colors.white,
              ),
              child: Text('Enviar', style: TextStyle(fontSize: 16.0)),
            ),
            SizedBox(height: 35.0),
            if (_nome.isNotEmpty && _telefone.isNotEmpty)
              Column(
                //Impressão dos dados
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Segue dados enviados para conferência:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                  SizedBox(height: 12.0),
                  Text('Nome: $_nome', style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 10.0),
                  Text('Telefone: $_telefone',
                      style: TextStyle(fontSize: 16.0)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
