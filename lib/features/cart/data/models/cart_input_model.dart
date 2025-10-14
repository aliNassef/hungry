import 'cart_item_input_model.dart';

class CartInputModel {
  final List<CartItemInputModel> items;

  CartInputModel({required this.items});

  Map<String, dynamic> toJson() {
    return {'items': items.map((item) => item.toJson()).toList()};
  }
}
