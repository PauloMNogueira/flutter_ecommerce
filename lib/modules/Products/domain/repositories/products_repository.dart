import 'package:ecommerce/modules/Products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Product createProduct(String name, String? description, int quantity,
      double price, double percentageDiscount, String imageUrl);
  List<Product> getProducts(String? name);
  Product getProductById(int id);
  List<Product> removeProduct(int id);
}
