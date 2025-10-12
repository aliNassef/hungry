import 'package:hungry/core/api/api_service.dart';
import 'package:hungry/core/api/end_ponits.dart';
import 'package:hungry/core/api/errors/exceptions.dart';
import 'package:hungry/features/home/data/models/meal_model.dart';

import '../../../../core/api/errors/error_model.dart';
import '../models/category_model.dart';

abstract class HomeRemoteDatasource {
  Future<List<CategoryModel>> getCategories();
  Future<List<MealModel>> getProducts({String? categoryId});
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiService _apiService;

  HomeRemoteDatasourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiService.get(EndPoints.categories);
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
    final categories = (response.data['data'] as List)
        .map((category) => CategoryModel.fromJson(category))
        .toList();
    return categories;
  }

  @override
  Future<List<MealModel>> getProducts({String? categoryId}) async {
    final response = await _apiService.get(
      EndPoints.products,
      queryParameters: categoryId != null ? {'category_id': categoryId} : null,
    );
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
    final products = (response.data['data'] as List)
        .map((product) => MealModel.fromJson(product))
        .toList();
    return products;
  }
}
