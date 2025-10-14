import 'package:dartz/dartz.dart';
import '../../../../core/api/errors/exceptions.dart';

import '../../../../core/api/errors/failure.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../models/slide_option_model.dart';
import '../models/topping_model.dart';

import '../datasource/home_remote_datasource.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDatasource _datasource;

  HomeRepoImpl({required HomeRemoteDatasource datasource})
    : _datasource = datasource;
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final categories = await _datasource.getCategories();
      return Right(categories);
    } on ServerException catch (failure) {
      return Left(Failure(errMessage: failure.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> getProducts({
    String? categoryId,
  }) async {
    try {
      final products = await _datasource.getProducts(categoryId: categoryId);
      return Right(products);
    } on ServerException catch (failure) {
      return Left(Failure(errMessage: failure.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<SlideOptionModel>>> getSideOptions() async {
    try {
      final sideOptions = await _datasource.getSideOptions();
      return Right(sideOptions);
    } on ServerException catch (failure) {
      return Left(Failure(errMessage: failure.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ToppingModel>>> getToppings() async {
    try {
      final toppings = await _datasource.getToppings();
      return Right(toppings);
    } on ServerException catch (failure) {
      return Left(Failure(errMessage: failure.errorModel.errorMessage));
    }
  }
}
