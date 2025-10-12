import 'cart_item_model.dart';

class CartInputModel {
  final List<CartItemModel> items;

  CartInputModel({required this.items});

  Map<String, dynamic> toJson() {
    return {'items': items.map((item) => item.toJson()).toList()};
  }
}
