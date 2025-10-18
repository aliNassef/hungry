import 'package:hungry/core/api/api_service.dart';
import 'package:hungry/core/api/end_ponits.dart';
import 'package:hungry/core/api/errors/error_model.dart';
import 'package:hungry/core/api/errors/exceptions.dart';

import '../models/order_history_model.dart';

abstract class OrderHistoryRemoteDatasource {
  Future<List<OrderHistoryModel>> getOrderHistory();
}

class OrderHistoryRemoteDatasourceImpl implements OrderHistoryRemoteDatasource {
  final ApiService _apiService;

  OrderHistoryRemoteDatasourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<List<OrderHistoryModel>> getOrderHistory() async {
    final response = await _apiService.get(EndPoints.orders);
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
    final List<dynamic> data = response.data;
    return data.map((json) => OrderHistoryModel.fromJson(json)).toList();
  }
}
