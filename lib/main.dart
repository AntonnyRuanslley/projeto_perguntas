// ignore_for_file: use_key_in_widget_constructors, annotate_overrides, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontucaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Quem é o pai do Naruto?',
      'respostas': [
        {'texto': 'Minato', 'pontuacao': 10},
        {'texto': 'Pain', 'pontuacao': 0},
        {'texto': 'Sasuke', 'pontuacao': 0},
        {'texto': 'Shikamaru', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Quem é o protagonista de Bleach?',
      'respostas': [
        {'texto': 'Kenpachi', 'pontuacao': 0},
        {'texto': 'Boruto', 'pontuacao': 0},
        {'texto': 'Ichigo', 'pontuacao': 10},
        {'texto': 'Seiya', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Quantas esfera do dração existem em Dragon Ball Z?',
      'respostas': [
        {'texto': '5', 'pontuacao': 0},
        {'texto': '7', 'pontuacao': 10},
        {'texto': '10', 'pontuacao': 0},
        {'texto': '12', 'pontuacao': 0},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontucaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontucaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontucaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
