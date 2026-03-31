import 'package:flutter/material.dart';

class teladois extends StatelessWidget {
  final String escolhaApp;
  final String escolhaUsuario;
  final String resultado;

  const teladois({
    super.key,
    required this.escolhaApp,
    required this.escolhaUsuario,
    required this.resultado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset('assets/images/$escolhaApp.png', width: 140, height: 140),

            const SizedBox(height: 10),

            const Text(
              'Escolha do APP',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 50),

            Image.asset('assets/images/$escolhaUsuario.png', width: 140, height: 140),

            const SizedBox(height: 10),

            const Text(
              'Sua escolha',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 40),

            Image.asset('assets/images/perder.png', width: 170, height: 170),

            const SizedBox(height: 10),

            Text(
              resultado,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Jogar novamente",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}