import 'package:ecommerceapp/services/api_services.dart';
import 'package:flutter/material.dart';

class CatogorySlider extends StatefulWidget {
  const CatogorySlider({
    super.key,
  });

  @override
  State<CatogorySlider> createState() => _CatogorySliderState();
}

class _CatogorySliderState extends State<CatogorySlider> {
  List<Text> categoryList = [];

  @override
  void initState() {
    print('initState');
    // TODO: implement initState
    super.initState();

    ApiServices.getCatageries().then((categoryies) {
      setState(() {
        categoryList.add(
          const Text('ALL'),
        );
        for (var catagory in categoryies) {
          categoryList.add(
            Text(
              catagory.toString().toUpperCase(),
            ),
          );
        }
      });
      print(categoryList);
      //setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 10,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: categoryList,
          ),
        ),
      ),
    );
  }
}
