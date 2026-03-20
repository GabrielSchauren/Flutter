import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste/teladois.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),

      body: Column(
        children: [
          SizedBox(height: 40),
          Image.asset('images/padrao.png', width: 500, height: 140),
          SizedBox(height: 10),
          Text(
            'Escolha do APP',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/pedra.png', width: 100, height: 100),
              SizedBox(width: 40),
              Image.asset('images/papel.png', width: 100, height: 100),
              SizedBox(width: 40),
              Image.asset('images/tesoura.png', width: 100, height: 100),
            ],
          ),
        ],
      ),
    );
  }
}
