import 'package:flutter/material.dart';

import '../calculadora.dart';
import '../home.dart';
import '../formulario.dart';

Widget Menu(BuildContext context) {
  return Drawer(
    child: ListView(
      //teste de comentario
      //padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          //MENU ABERTO
          decoration: BoxDecoration(
            color: Color(0xffbe8fe5),
          ),
          child: Text('Confira as nossas opções abaixo!'),
        ),

        //OPÇÃO >> HOME
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MyHomePage(title: "Bem-vindo a Home")),
            );
          },
        ),

        //OPÇÃO >> FORMULARIO
        ListTile(
          title: const Text('Inscreva-se'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Formulario()),
            );
          },
        ),

        //OPÇÃO >> CALCULADORA
        ListTile(
          title: const Text('Calculadora'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Calculadora()),
            );
          },
        ),
      ],
    ),
  );
}
