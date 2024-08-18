// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _notaTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': [
        {
          'texto': 'Preto',
          'nota': 1,
        },
        {
          'texto': 'Vermelho',
          'nota': 2,
        },
        {
          'texto': 'Verde',
          'nota': 3,
        },
        {
          'texto': 'Branco',
          'nota': 4,
        },
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {
          'texto': 'Coelho',
          'nota': 1,
        },
        {
          'texto': 'Cobra',
          'nota': 2,
        },
        {
          'texto': 'Elefante',
          'nota': 3,
        },
        {
          'texto': 'Leão',
          'nota': 4,
        }
      ]
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {
          'texto': 'Maria',
          'nota': 1,
        },
        {
          'texto': 'João',
          'nota': 2,
        },
        {
          'texto': 'Léo',
          'nota': 3,
        },
        {
          'texto': 'Pedro',
          'nota': 4,
        }
      ]
    },
  ];

  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += nota;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(
                _notaTotal,
                _reiniciarQuestionario,
              ),
      ),
    );
  }
}
