import 'package:calculadora/app/formulario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(context), //Chama menu
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Bem-vindo(a) =D"),
      ),
      body: SingleChildScrollView(
        //Permite rolar a tela
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*const Image(
              image: NetworkImage(
                  'https://img.freepik.com/vetores-gratis/padrao-sem-emenda-com-papelaria-escolar-e-de-escritorio_107791-9568.jpg'),
            ),*/
            Image.asset('assets/imagens/wallpaper2.png'),
            //Image.asset('assets/imagens/wallpaper.png'),
            //Image.asset('assets/imagens/gif-do-homem-aranha.gif')
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
