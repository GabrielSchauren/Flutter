import 'package:flutter/material.dart';
import 'teladois.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _jogar(String escolhaUsuario) {
    String escolhaApp;

    if (escolhaUsuario == 'pedra') {
      escolhaApp = 'papel';
    } else if (escolhaUsuario == 'papel') {
      escolhaApp = 'tesoura';
    } else {
      escolhaApp = 'pedra';
    }

    String resultado = 'Você perdeu!';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => teladois(
          escolhaApp: escolhaApp,
          escolhaUsuario: escolhaUsuario,
          resultado: resultado,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedra, Papel, Tesoura', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          Image.asset('assets/images/padrao.png', width: 140, height: 140),

          const SizedBox(height: 10),

          const Text(
            'Escolha do APP',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 150),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                onTap: () => _jogar('pedra'),
                child: Image.asset('assets/images/pedra.png', width: 100, height: 100),
              ),

              const SizedBox(width: 40),

              GestureDetector(
                onTap: () => _jogar('papel'),
                child: Image.asset('assets/images/papel.png', width: 100, height: 100),
              ),

              const SizedBox(width: 40),

              GestureDetector(
                onTap: () => _jogar('tesoura'),
                child: Image.asset('assets/images/tesoura.png', width: 100, height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}