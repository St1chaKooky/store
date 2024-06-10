import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: ColorCollection.white),
      width: double.infinity,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: width / 2.24,
              child: Align(
                alignment: Alignment.topLeft, // Align to top-right corner
                child: Image.network(
                  'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Рейтинг: 1.9',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text('Кол-во покупок: 100',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Категория: jewelery',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Читать дальше'),
                    
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Цена: 213',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
