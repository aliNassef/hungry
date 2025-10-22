import 'package:hungry/features/checkout/data/model/checkout_item_model.dart';

class CheckoutInputModel {
  final List<CheckoutItemModel> items;

  CheckoutInputModel({required this.items});

  factory CheckoutInputModel.fromJson(json) {
    return CheckoutInputModel(
      items: (json['items'] as List)
          .map((item) => CheckoutItemModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'items': items};
  }
}
