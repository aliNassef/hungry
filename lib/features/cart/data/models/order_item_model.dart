// lib/features/orders/data/models/order_item_model.dart

import 'package:hungry/features/home/data/models/slide_option_model.dart';
import 'package:hungry/features/home/data/models/topping_model.dart';

class OrderItemModel {
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final double price;
  final double? spicy; // Nullable to handle various data types like "0.10" or 0
  final List<ToppingModel> toppings;
  final List<SlideOptionModel> sideOptions;

  OrderItemModel({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    this.spicy,
    required this.toppings,
    required this.sideOptions,
  });
  Map<String, dynamic> toJson() {
    return {
      'item_id': itemId,
      'product_id': productId,
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price.toString(),
      'spicy': spicy?.toString(),
      'toppings': toppings.map((topping) => topping.toJson()).toList(),
      'side_options': sideOptions.map((option) => option.toJson()).toList(),
    };
  }

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    List<ToppingModel> parseToppings(List<dynamic> jsonList) {
      return jsonList
          .map(
            (optionJson) =>
                ToppingModel.fromJson(optionJson as Map<String, dynamic>),
          )
          .toList();
    }

    List<SlideOptionModel> parseOptions(List<dynamic> jsonList) {
      return jsonList
          .map(
            (optionJson) =>
                SlideOptionModel.fromJson(optionJson as Map<String, dynamic>),
          )
          .toList();
    }

    double? parseSpicy(dynamic spicyValue) {
      if (spicyValue == null) return null;
      return double.tryParse(spicyValue.toString());
    }

    return OrderItemModel(
      itemId: json['item_id'] as int,
      productId: json['product_id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      quantity: json['quantity'] as int,
      price: double.parse(json['price'] as String),
      spicy: parseSpicy(json['spicy']),
      toppings: parseToppings(json['toppings'] as List),
      sideOptions: parseOptions(json['side_options'] as List),
    );
  }

  OrderItemModel copyWith({
    int? itemId,
    int? productId,
    String? name,
    String? image,
    int? quantity,
    double? price,
    double? spicy,
    List<ToppingModel>? toppings,
    List<SlideOptionModel>? sideOptions,
  }) {
    return OrderItemModel(
      itemId: itemId ?? this.itemId,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      spicy: spicy ?? this.spicy,
      toppings: toppings ?? List<ToppingModel>.from(this.toppings),
      sideOptions: sideOptions ?? List<SlideOptionModel>.from(this.sideOptions),
    );
  }
}
