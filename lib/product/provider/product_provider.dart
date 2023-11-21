import 'package:flutter/material.dart';
import 'package:task/product/model/product_model.dart';
import 'package:task/product/repository/product_repository.dart';
import 'package:task/utils/shared_preference_service.dart';
import 'package:task/utils/app_constant.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider(this.productRepository);

  ProductRepository productRepository;

  bool isLoading = false;
  List<ProductInfo> productList = [];

  Future<void> loadProducts() async {
    try {
      isLoading = true;
      notifyListeners();
      productList = await productRepository.getProducts();
      await applyFavoriteStatus(productList);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      AppConstant.showToast(e.toString());
      notifyListeners();
    }
  }

  void updateFavoriteStatus(ProductInfo productInfo) {
    productInfo.isFavorite = !(productInfo.isFavorite ?? false);
    notifyListeners();
    SharedPreferenceService.addFavoriteProduct(productInfo);
  }

  List<ProductInfo> getSortProductByFavorite() {
    final sortedList = <ProductInfo>[...productList];
    sortedList.sort((a, b) {
      if (b.isFavorite ?? false) {
        return 1;
      }
      return -1;
    });
    return sortedList;
  }

  Future<List<ProductInfo>> getFavoriteProduct() {
    return SharedPreferenceService.getFavoriteProducts();
  }

  Future<void> applyFavoriteStatus(
    List<ProductInfo> originalProducts,
  ) async {
    final favoriteProducts = await getFavoriteProduct();

    for (final favoriteProduct in favoriteProducts) {
      for (final originalProduct in originalProducts) {
        if (favoriteProduct.id == originalProduct.id) {
          originalProduct.isFavorite = favoriteProduct.isFavorite;
        }
      }
    }
  }
}
