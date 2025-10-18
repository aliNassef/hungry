import 'package:dio/dio.dart';
import 'package:hungry/core/api/api_service.dart';
import 'package:hungry/core/api/end_ponits.dart';
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
    final response = await _apiService.get(EndPoints.orders) as Response;

    final List<dynamic> data = response.data['data'];
    return data.map((json) => OrderHistoryModel.fromJson(json)).toList();
  }
}
