import 'package:flutter/material.dart';
import 'package:task/product/model/product_model.dart';
import 'package:task/product/ui/screen/product_details_screen.dart';
import 'package:task/product/ui/widget/image_widget.dart';
import 'package:task/product/ui/widget/product_list_item_widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductInfo> productList;

  const ProductListWidget({required this.productList, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => ProductDetail(
                  product: product,
                ),
              ),
            );
          },
          child: ProductListItemWidget(product: product),
        );
      },
    );
  }
}
