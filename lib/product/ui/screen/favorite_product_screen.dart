import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/product/provider/product_provider.dart';
import 'package:task/product/ui/widget/product_list_widget.dart';
import 'package:task/utils/string_const.dart';

class FavoriteProductScreen extends StatefulWidget {
  const FavoriteProductScreen({super.key});

  @override
  State<FavoriteProductScreen> createState() => _FavoriteProductScreenState();
}

class _FavoriteProductScreenState extends State<FavoriteProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(products),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            return ProductListWidget(
              productList: productProvider.getSortProductByFavorite(),
            );
          },
        ),
      ),
    );
  }
}
