import 'package:ecommerce/modules/Products/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/Products/domain/repositories/products_repository.dart';
import 'package:ecommerce/modules/Products/domain/usecases/create_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  MockProductRepository repository;

  test("Should return an new product", () {
    repository = MockProductRepository();
    final Product result = CreateProduct(repository)
        .call("Iphone 11", "Novo celular", 20, 11000.00, 10, "");
    expect(
        result,
        Product(
            id: 1,
            imageUrl: "",
            name: "Iphone 11",
            price: 11000.00,
            percentageDiscount: 10));
  });
}
