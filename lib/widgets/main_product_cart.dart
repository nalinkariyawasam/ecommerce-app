import 'package:flutter/material.dart';

class MainProdouctCart extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  const MainProdouctCart({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: 200,
                    height: 350,
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Text(title),
            ),
            Text(
              '\$$price',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
