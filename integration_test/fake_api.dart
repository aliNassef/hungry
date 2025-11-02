import 'package:dartz/dartz.dart';
import 'package:hungry/core/api/errors/failure.dart';
import 'package:hungry/features/auth/data/models/login_input_model.dart';
import 'package:hungry/features/auth/data/models/login_model.dart';
import 'package:hungry/features/auth/data/models/register_input_model.dart';
import 'package:hungry/features/auth/data/repo/auth_repo.dart';
import 'package:hungry/features/home/data/models/category_model.dart';
import 'package:hungry/features/home/data/models/meal_model.dart';
import 'package:hungry/features/home/data/models/slide_option_model.dart';
import 'package:hungry/features/home/data/models/topping_model.dart';
import 'package:hungry/features/home/data/repo/home_repo.dart';

class FakeAuthRepo extends AuthRepo {
  @override
  Future<bool> isLoggedIn() async {
    return false;
  }

  @override
  Future<Either<Failure, UserModel>> login(
    LoginInputModel loginInputModel,
  ) async {
    return right(
      UserModel(
        name: 'Ali',
        email: 'test@gmail.com',
        token: '1111111',
        img: '',
      ),
    );
  }

  @override
  Future<Either<Failure, UserModel>> register(
    RegisterInputModel registerInputModel,
  ) {
    // TODO: implement register
    throw UnimplementedError();
  }
}


class FakeHomeRepo implements HomeRepo {
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    // Simulate a successful categories fetch using the dummy data from the model
    return Future.value(Right(CategoryModel.dummy));
  }

  @override
  Future<Either<Failure, List<MealModel>>> getProducts({
    String? categoryId,
  }) async {
    // Simulate a successful products fetch using the dummy data from the model
    // We can add logic here to filter based on categoryId if needed

    // For now, just return all dummy meals
    return Future.value(Right(MealModel.dummy));
  }

  @override
  Future<Either<Failure, List<SlideOptionModel>>> getSideOptions() async {
    // Simulate a successful side options fetch
    return Future.value(Right(SlideOptionModel.dummy));
  }

  @override
  Future<Either<Failure, List<ToppingModel>>> getToppings() async {
    // Simulate a successful toppings fetch
    return Future.value(Right(ToppingModel.dummy));
  }
}
