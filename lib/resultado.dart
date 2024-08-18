import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(
    this.pontuacao,
    this.reiniciarQuestionario,
  );

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Top';
    } else {
      return 'Máximo';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue, // foreground
          ),
          onPressed: reiniciarQuestionario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
