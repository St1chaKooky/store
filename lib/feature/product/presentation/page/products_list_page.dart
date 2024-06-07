import 'package:fake_store/feature/product/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Список товара:'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _categoryListBuilder,
            const SizedBox(
              height: 10,
            ),
            _listProducts
          ],
        ),
      ),
    );
  }

  Widget get _categoryListBuilder => Container(
        height: 86,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(
              name: 'electroinic',
              path:
                  'https://img.icons8.com/?size=100&id=wrd1I6wFafrm&format=png&color=000000',
            );
          },
          // Corrected line with closing parenthesis
          itemCount: 4,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 5,
          ),
        ),
      );
  Widget get _listProducts => ListView.separated(
        itemBuilder: (BuildContext context, int index) => Container(
          width: 200,
          height: 200,
          color: Colors.amber,
        ),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10,
        ),
        itemCount: 10,
      );
}
