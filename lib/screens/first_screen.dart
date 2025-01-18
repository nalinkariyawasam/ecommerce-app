import 'package:flutter/material.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  final String price;

  const FirstScreen({
    super.key,
    required this.price,
  });

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('First Screen'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(
                      //price: widget.price,
                    ),
                  ),
                );
              },
              child: const Text('Go to Next Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
