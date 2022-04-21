// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  //const ({ Key? key }) : super(key: key//);
  final int pontuacao;
  final Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseFinal {
    if (pontuacao <= 10) {
      return 'Você é fraco, te falta anime!!';
    } else if (pontuacao <= 20) {
      return 'Assiste alguns, boa!!';
    } else {
      return 'Otaku fedido!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseFinal,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            primary: Colors.white,
          ),
          child: Text('Reiniciar'),
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
