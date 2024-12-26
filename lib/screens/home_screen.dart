import 'package:ecommerceapp/widgets/catogory_slider.dart';
import 'package:ecommerceapp/widgets/main_product_cart.dart';
import 'package:flutter/material.dart';

import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List productsListByCategory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
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

          FutureBuilder(
            future: ApiServices.getCatageries(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List categoryList = ["All"];
                categoryList.addAll(snapshot.data!);
                return Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          onTap: () {
                            //print(categoryList[index]);
                            ApiServices.getProductsByCategory(
                              category: categoryList[index].toString(),
                            ).then((value) {
                              setState(() {
                                productsListByCategory = value;
                              });
                            });
                          },
                          child: Text(
                            categoryList[index].toString().toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          productsListByCategory.isNotEmpty
              ? SizedBox(
                  height: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: productsListByCategory.length,
                    itemBuilder: (context, index) => MainProdouctCart(
                      title: productsListByCategory[index]['title'],
                      price: productsListByCategory[index]['price'].toString(),
                      imageUrl: productsListByCategory[index]['image'],
                    ),
                  ),
                )
              : FutureBuilder(
                  future: ApiServices.getProducts(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List allProduct = snap.data!;
                      return SizedBox(
                        height: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: allProduct.length,
                          itemBuilder: (context, index) => MainProdouctCart(
                            title: allProduct[index]['title'],
                            price: allProduct[index]['price'].toString(),
                            imageUrl: allProduct[index]['image'],
                          ),
                        ),
                      );
                    }
                  },
                ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 10, top: 10),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [
          //         MainProdouctCart(),
          //         MainProdouctCart(),
          //         MainProdouctCart(),
          //         MainProdouctCart(),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
