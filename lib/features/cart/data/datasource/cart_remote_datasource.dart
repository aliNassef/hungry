import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/api/errors/exceptions.dart';
import '../models/cart_input_model.dart';
import '../models/order_model.dart';

import '../../../../core/api/errors/error_model.dart';
import '../models/cart_item_input_model.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(CartItemInputModel cartItemModel);
  Future<OrderModel> getCartItems();
  Future<void> removeFromCart({required int id});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService _apiService;

  CartRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<void> addToCart(CartItemInputModel cartItemModel) async {
    final response = await _apiService.post(
      EndPoints.addToCart,
      data: CartInputModel(items: [cartItemModel]).toJson(),
    );
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }

    return;
  }

  @override
  Future<OrderModel> getCartItems() async {
    final response = await _apiService.get(EndPoints.cart);
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
    return OrderModel.fromJson(response.data['data']);
  }

  @override
  Future<void> removeFromCart({required int id}) async {
    final response = await _apiService.delete(
      EndPoints.removeFromCart + id.toString(),
    );

    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
