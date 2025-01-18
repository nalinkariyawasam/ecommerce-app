import 'package:ecommerceapp/screens/third_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {

  const SecondScreen({super.key,});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('First Screen'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThirdScreen(
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
