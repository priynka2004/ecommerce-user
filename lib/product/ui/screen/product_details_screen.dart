import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/product/model/product_model.dart';
import 'package:task/product/provider/product_provider.dart';
import 'package:task/product/ui/widget/image_widget.dart';
import 'package:task/utils/string_const.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({required this.product, super.key});

  final ProductInfo product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(productDetail),
        actions: [
          IconButton(
            onPressed: updateFavoriteStatus,
            icon: Icon(
              Icons.favorite,
              color: (widget.product.isFavorite ?? false)
                  ? Colors.red
                  : Colors.grey,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CachedImage(
                    image: widget.product.thumbnail,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.product.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.product.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateFavoriteStatus() {
    Provider.of<ProductProvider>(context, listen: false)
        .updateFavoriteStatus(widget.product);
    setState(() {});
  }
}
