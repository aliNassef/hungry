import 'package:hungry/core/api/api_service.dart';
import 'package:hungry/core/api/end_ponits.dart';
import 'package:hungry/core/api/errors/exceptions.dart';
import 'package:hungry/features/cart/data/models/cart_input_model.dart';

import '../../../../core/api/errors/error_model.dart';
import '../models/cart_item_model.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(CartItemModel cartItemModel);
  // Future<void> removeFromCart(String cartItemId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService _apiService;

  CartRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<void> addToCart(CartItemModel cartItemModel) async {
    final response = await _apiService.post(
      EndPoints.addToCart,
      data: CartInputModel(items: [cartItemModel]).toJson(),
    );
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }

    return;
  }
}
