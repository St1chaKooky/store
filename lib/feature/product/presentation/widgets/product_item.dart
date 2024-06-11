import 'package:fake_store/core/router/router.dart';
import 'package:fake_store/feature/product/data/models/product_item.dart';
import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () => context.push(RouteList.productDetails(product.id.toString())),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: ColorCollection.white),
        width: double.infinity,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(10).copyWith(left: 0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(9),
                width: width / 2.24,
                child: Center(
                  child: Image.network(
                    product.image,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                width: 170,
                child: Column(
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
                          softWrap: true,
                          'Рейтинг: ${product.rating.rate}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text('Продано: ${product.rating.count}',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(
                          height: 5,
                        ),
                        
                          
                           Text('Категория: ${product.category}',
                          softWrap: true,
                          maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
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
                          'Цена: ${product.price}\$',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
