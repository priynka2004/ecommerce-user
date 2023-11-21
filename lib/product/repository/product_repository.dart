import 'package:task/product/model/product_model.dart';
import 'package:task/product/service/product_service.dart';

class ProductRepository {
  ProductRepository(this.productService);

  ProductService productService;

  Future<List<ProductInfo>> getProducts() {
    return productService.getProduct();
  }
}
