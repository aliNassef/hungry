import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_ponits.dart';
import '../model/checkout_input_model.dart';

abstract class CheckoutRemoteDatasource {
  Future<void> addOrder(CheckoutInputModel order);
}

class CheckoutRemoteDatasourceImpl extends CheckoutRemoteDatasource {
  final ApiService _apiService;

  CheckoutRemoteDatasourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<void> addOrder(CheckoutInputModel order) async {
    await _apiService.post(EndPoints.orders, data: order.toJson());
  }
}
