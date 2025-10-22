class CheckoutItemModel {
  final int productId, quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;
  CheckoutItemModel({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });
  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'spicy': spicy,
      'toppings': toppings,
      'side_options': sideOptions,
    };
  }

  factory CheckoutItemModel.fromJson(Map<String, dynamic> json) {
    return CheckoutItemModel(
      productId: json['product_id'],
      quantity: json['quantity'],
      spicy: json['spicy'].toDouble(),
      toppings: List<int>.from(json['toppings'].map((x) => x)),
      sideOptions: List<int>.from(json['side_options'].map((x) => x)),
    );
  }
}
