import 'order_item_model.dart';

class OrderModel {
  final int id;
  final double totalPrice;
  final List<OrderItemModel> items;

  OrderModel({required this.id, required this.totalPrice, required this.items});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as int,
      totalPrice: double.parse(json['total_price'] as String),
      items: (json['items'] as List)
          .map(
            (itemJson) =>
                OrderItemModel.fromJson(itemJson as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  static OrderModel dummy = OrderModel(
    id: 1,
    totalPrice: 29.99,
    items: [
      OrderItemModel(
        itemId: 101,
        productId: 201,
        name: 'Pizza Margherita',
        image: 'http://sonic-zdi0.onrender.com/storage/toppings/pickles.png',
        quantity: 2,
        price: 12.99,
        spicy: 1.0,
        toppings: [],
        sideOptions: [],
      ),
      OrderItemModel(
        itemId: 102,
        productId: 202,
        name: 'Coke',
        image: 'http://sonic-zdi0.onrender.com/storage/toppings/pickles.png',
        quantity: 1,
        price: 4.01,
        spicy: 0.0,
        toppings: [],
        sideOptions: [],
      ),
    ],
  );
}
