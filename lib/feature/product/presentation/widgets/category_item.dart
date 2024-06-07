import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String path;

  const CategoryItem({super.key, required this.name, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      width: 80,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: ColorCollection.white,
                borderRadius: BorderRadius.circular(18)),
            child: Center(
                child: Image.network(
              path,
              width: 35,
              height: 35,
            )),
          ),
          SizedBox(
            height: 4,
          ),
          Text(name),
        ],
      ),
    );
  }
}
