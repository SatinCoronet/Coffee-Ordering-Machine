import 'package:flutter_project/Coffee_prefs.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Order Page', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
           )
          ),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Container(
            color: Colors.brown[200],
            padding:EdgeInsets.all(20),
            child: Text("How would you like your coffee?", style: TextStyle(
              color: Colors.brown[900],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            )
            ),
            Container(
            color: Colors.brown[100],
            padding:EdgeInsets.all(20),
            child: const Coffee_prefs()
            ),
            Expanded(
              child:Image.asset('assets/img/coffee_bg.jpg',
              fit: BoxFit.fitWidth,
              alignment: AlignmentGeometry.bottomCenter,
              ),
              
          ),
        ]
      )
    );
  }
}