import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/providers/product_provider.dart';
import 'package:ecommerceapp/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainProdouctCart extends StatefulWidget {
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
  State<MainProdouctCart> createState() => _MainProdouctCartState();
}

class _MainProdouctCartState extends State<MainProdouctCart> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProductProvider>().addProduct(
              Product(
                title: widget.title,
                price: double.parse(widget.price),
                image: widget.imageUrl,
              ),
            );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstScreen(
              price: widget.price,
            ),
          ),
        );
      },
      child: Padding(
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
                      widget.imageUrl,
                      width: 200,
                      height: 350,
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(widget.title),
              ),
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FavoriteIcon(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
  });

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed != isPressed;
        });
      },
      child: Icon(
        Icons.favorite,
        color: isPressed ? Colors.red : Colors.grey,
      ),
    );
  }
}
