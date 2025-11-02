import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/meal_model.dart';
import '../../../data/repo/home_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this._homeRepo) : super(GetProductsInitial());
  final HomeRepo _homeRepo;
  Future<void> getProducts({String? categoryId}) async {
    emit(GetProductsLoading());
    final productsOrfailure = await _homeRepo.getProducts(
      categoryId: categoryId,
    );
    productsOrfailure.fold(
      (failure) => emit(GetProductsError(errMessage: failure.errMessage)),
      (products) => emit(GetProductsLoaded(meals: products)),
    );
  }
}
