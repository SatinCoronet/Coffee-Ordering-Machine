import 'package:flutter/material.dart';
import 'package:flutter_project/OrderSummary.dart';

class Coffee_prefs extends StatefulWidget {
  const Coffee_prefs({super.key});

  @override
  State<Coffee_prefs> createState() => _Coffee_prefsState();
}

class _Coffee_prefsState extends State<Coffee_prefs> {

  int strength=1;
  int sugars=0;
  int milk = 0;

void increasestrength () {
  setState(() {
    strength = strength < 5? strength+1 : 1;
  });
  
}

void increasesugar () {
  setState(() {
    sugars = sugars < 5? sugars+1 : 0;
  });
}

void increasemilk() {
  setState(() {
    milk = milk < 5 ? milk + 1 : 0;
  });
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Strength: "),
            
            for (int i=0; i<strength; i++)
              Image.asset('assets/img/coffee_bean.png',
                width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
            ),
            Expanded(child: SizedBox(),),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.brown,
                backgroundColor: Colors.brown[200]
              ),
              onPressed: increasestrength, 
              child: Text('+')
            )

          ],
        ),
        Row(
          children: [
            Text("Sugars: "),
            
            if (sugars == 0)
              Text ('No Sugars...', style: TextStyle(fontWeight: FontWeight.bold),),

            for (int i=0; i<sugars;i++)
              Image.asset('assets/img/sugar_cube.png',
              width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
            ),
             Expanded(child: SizedBox(),),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.brown,
                backgroundColor: Colors.brown[200]
                
              ),
              onPressed: increasesugar, 
              child: Text('+')
            )
          ],
        ),
        Row(
          children: [
            Text("Milk: "),
            if (milk == 0)
              Text ('No Milk...', style: TextStyle(fontWeight: FontWeight.bold),),
              
            for (int i=0; i<milk; i++)
              Icon(Icons.local_cafe, color: Colors.brown[300], size: 25,),
            Expanded(child: SizedBox(),),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.brown,
                backgroundColor: Colors.brown[200]
              ),
              onPressed: increasemilk, 
              child: Text('+')
            )

          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown[700],
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderSummary(
                  strength: strength, 
                  sugars: sugars,
                  milk: milk
                ),
              ),
            );
          },
          child: const Text('View Order Summary'),
        ),
      ],
    );
  }
  
}