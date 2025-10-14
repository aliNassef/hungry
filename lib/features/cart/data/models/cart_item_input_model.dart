// lib/models/cart_item_model.dart

class CartItemInputModel {
  final int productId;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;

  CartItemInputModel({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'product_id': productId,
      'quantity': quantity,
      'toppings': toppings,
      'side_options': sideOptions,
      'spicy': spicy,
    };

    return data;
  }
}
