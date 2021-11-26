import 'package:ecommerce/modules/Products/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/Products/domain/repositories/products_repository.dart';

class CreateProduct {
  final ProductRepository repository;

  CreateProduct(this.repository);

  Product call(String name, String description, int quantity, double price,
      int percentageDiscount, String imageUrl) {
    return Product(
        id: 1,
        imageUrl: imageUrl,
        name: name,
        price: price,
        percentageDiscount: percentageDiscount);
  }
}
