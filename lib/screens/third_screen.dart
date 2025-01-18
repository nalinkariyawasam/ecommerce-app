import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({
    super.key,
  });

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Third Screen'),
            Text(
                'Price: \$${context.read<ProductProvider>().selectedProduct.price}'),
          ],
        ),
      ),
    );
  }
}
