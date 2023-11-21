import 'package:dio/dio.dart';
import 'package:task/product/model/product_model.dart';
import 'package:task/utils/endpoint/api_endpoint.dart';

class ProductService {
  Future<List<ProductInfo>> getProduct() async {
    final response = await Dio().get(ApiEndPoint.getProducts);
    if (response.statusCode == 200) {
      ProductModel productModel = ProductModel.fromJson(response.data);
      return productModel.products ?? [];
    } else {
      throw 'Something went wrong';
    }
  }
}
