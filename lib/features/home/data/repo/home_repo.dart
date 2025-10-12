import 'package:dartz/dartz.dart';
import 'package:hungry/core/api/errors/failure.dart';
import 'package:hungry/features/home/data/models/meal_model.dart';

import '../models/category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<MealModel>>> getProducts({String? categoryId});
}
