import 'package:flutter/material.dart';

class teladois extends StatefulWidget {
  const teladois({super.key});

  @override
  State<teladois> createState() => _State();
}

class _State extends State<teladois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedra,Papel, Tesoura', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height: 5),
            Image.asset('images/papel.png', width: 140, height: 140, alignment: AlignmentGeometry.center,),
            SizedBox(height: 10),
            Text('Escolha do APP', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 80),
            Image.asset('images/pedra.png', width: 140, height: 140),
            SizedBox(height: 10),
            Text('Sua escolha', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 40),
            Image.asset('images/perder.png', width: 170, height: 170, fit: BoxFit.contain,),
            SizedBox(height: 10),
            Text('Voce Perdeu/venceu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),)),
              onPressed: () {},
              child: Text("Jogar novamente",  style: TextStyle(fontSize: 24, color: Colors.white),),),
          ],
        ),
      ),
    );
  }
}