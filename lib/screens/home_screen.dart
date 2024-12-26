import 'package:ecommerceapp/widgets/catogory_slider.dart';
import 'package:ecommerceapp/widgets/main_product_cart.dart';
import 'package:flutter/material.dart';

import '../services/api_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'E-Commy',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.person),
              ],
            ),
          ),
          CatogorySlider(),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MainProdouctCart(),
                  MainProdouctCart(),
                  MainProdouctCart(),
                  MainProdouctCart(),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
