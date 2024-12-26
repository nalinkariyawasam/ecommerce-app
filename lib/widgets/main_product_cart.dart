
import 'package:flutter/material.dart';

class MainProdouctCart extends StatelessWidget {
  const MainProdouctCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  width: 200,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text('Woment T-shirt'),
            const Text('Price: \$20'),
          ],
        ),
      ),
    );
  }
}
