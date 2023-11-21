import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/auth/model/user_model.dart';
import 'package:task/product/model/product_model.dart';
import 'package:task/utils/string_const.dart';

class SharedPreferenceService {
  static Future<void> saveUser(User user) async {
    final userDetails = jsonEncode(user.toJson());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userDetails", userDetails);
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString("userDetails");
    if (userStr != null) {
      return User.fromJson(jsonDecode(userStr));
    }
    return null;
  }

  static Future<void> addFavoriteProduct(ProductInfo productInfo) async {
    final productList = await getFavoriteProducts();

    if (productList.isEmpty) {
      productList.add(productInfo);
    } else {
      for (final element in productList) {
        if (element.id == productInfo.id) {
          element.isFavorite = productInfo.isFavorite;
          break;
        }
      }
    }
    final prefs = await SharedPreferences.getInstance();
    final dataList = productList.map((e) => jsonEncode(e.toJson())).toList();

    await prefs.setStringList(favoriteProducts, dataList);
  }

  static Future<List<ProductInfo>> getFavoriteProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final dataList = prefs.getStringList(favoriteProducts);
    return dataList?.map((e) => ProductInfo.fromJson(jsonDecode(e))).toList() ??
        [];
  }
}
