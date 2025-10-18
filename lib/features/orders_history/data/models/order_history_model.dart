import 'package:equatable/equatable.dart';

class OrderHistoryModel extends Equatable {
  final int id;
  final String status;
  final String totalPrice;
  final String createdAt;
  final String productImage;

  const OrderHistoryModel({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.productImage,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      id: json['id'] as int,
      status: json['status'] as String,
      totalPrice: json['total_price'] as String,
      createdAt: json['created_at'] as String,
      productImage: json['product_image'] as String,
    );
  }

  @override
  List<Object?> get props => [id, status, totalPrice, createdAt, productImage];
}
