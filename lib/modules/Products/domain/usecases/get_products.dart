import 'dart:convert';

import 'package:ecommerce/modules/Products/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/Products/domain/repositories/products_repository.dart';
import 'package:http/http.dart' as http;

class GetProducts {
  final ProductRepository repository;
  final http.Client client;
  var body;

  GetProducts(this.repository, this.client);
  double _convertDouble(String price) {
    if (price.isNotEmpty) {
      return double.parse(price);
    }
    return 0.0;
  }

  Future<List<Product>> call() async {
    final String url =
        "https://t2.riomarevoce.com.br/wp-json/xarx/middleware/products/";
    final res = await client.get(Uri.parse(url));

    if (res.statusCode == 200) {
      List body = jsonDecode(res.body);
      List<Product> products = body
          .map((item) => Product(
              id: item["id"],
              imageUrl: "",
              name: item["name"],
              price: _convertDouble(item["price"]),
              percentageDiscount: 0))
          .toList();
      return products;
    } else {
      throw new Exception();
    }
  }
}
