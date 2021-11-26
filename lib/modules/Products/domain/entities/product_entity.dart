import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String? description;
  final int? quantity;
  final double price;
  final int percentageDiscount;
  final String imageUrl;

  Product(
      {required this.id,
      required this.imageUrl,
      required this.name,
      this.description,
      this.quantity,
      required this.price,
      required this.percentageDiscount});

  @override
  List<Object> get props => [id, name, price, percentageDiscount, imageUrl];
}
