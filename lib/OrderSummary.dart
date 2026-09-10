import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  final int strength;
  final int sugars;
  final int milk;

  const OrderSummary({super.key, required this.strength, required this.sugars, required this.milk});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

String getCoffeeName (int strength, int sugars, int milk) {
if (milk == 0 && strength >= 4) {
    return 'Espresso';
  } else if (milk <= 1 && strength >= 4) {
    return 'Macchiato';
  } else if (milk >= 4 && strength <= 2) {
    return 'Latte';
  } else if (milk >= 2 && milk <= 3 && strength >= 3) {
    return 'Cappuccino';
  } else if (sugars >= 4 && strength >= 3) {
    return 'Mocha';
  }
  return 'Custom Blend🍵';
}

class _OrderSummaryState extends State<OrderSummary> {
  bool isLoading = false;
  bool orderPlaced = false;
  String message = '';
  Stream<int>? brewStream;

  
  Future<String> placeOrder() async {
    await Future.delayed(const Duration(seconds: 2)); 
    return 'Order confirmed!';
  }

  
  Stream<int> brewCountdown() async* {
    for (int i = 3; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  void handlePlaceOrder() async {
    setState (() => isLoading = true); 

    final result = await placeOrder(); 

    setState (() {
      isLoading = false;
      message = result;
      orderPlaced = true;
      brewStream = brewCountdown(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary', 
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
           )
        ), 
      backgroundColor: Colors.brown[700], 
      centerTitle: true
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Strength: ${widget.strength}', style: const TextStyle(fontSize: 18)),
            Text('Sugars: ${widget.sugars}', style: const TextStyle(fontSize: 18)),
            Text('Milk: ${widget.milk}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text('Coffee Type: ${getCoffeeName(widget.strength, widget.sugars, widget.milk)}', 
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: Colors.brown,
              )
            ),
            const SizedBox(height: 20),

            if (!orderPlaced)
              ElevatedButton(
                onPressed: isLoading ? null : handlePlaceOrder,
                child: isLoading? 
                const SizedBox(
                        width: 20, 
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text('Place Order'),
              ),

            if (orderPlaced)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  StreamBuilder<int>(
                    stream: brewStream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Text('Starting brew...');
                      if (snapshot.data == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your coffee is ready! ☕', 
                            style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                            
                            SizedBox(height: 15),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown,
                                foregroundColor: Colors.white
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: const Text('Back to Home'),
                            ),
                          ],
                        );
                      }
                      return Text('Brewing... ${snapshot.data}');
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}