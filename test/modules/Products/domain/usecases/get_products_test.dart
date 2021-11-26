import 'package:ecommerce/modules/Products/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/Products/domain/repositories/products_repository.dart';
import 'package:ecommerce/modules/Products/domain/usecases/get_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_products_test.mocks.dart';

class MockProductRepository extends Mock implements ProductRepository {}

@GenerateMocks([http.Client])
void main() {
  MockProductRepository repository;

  test("Should return a list of Products", () async {
    final client = MockClient();
    when(client.get(Uri.parse(
            "https://t2.riomarevoce.com.br/wp-json/xarx/middleware/products/")))
        .thenAnswer((_) async => http.Response(
            '[{"pr":"quit", "id": 76178, "name": "02 Sanduíches + Refrigerante", "price": "18.9", "image":""}]',
            200));
    repository = MockProductRepository();
    final List<Product> mockList = [
      Product(
        id: 76178,
        imageUrl: "",
        name: "02 Sanduíches + Refrigerante",
        percentageDiscount: 0,
        price: 18.9,
      ),
    ];
    final List<Product> result = await GetProducts(repository, client).call();
    print(result);
    expect(result, mockList);
    expect(result, isA<List<Product>>());
  });
}
