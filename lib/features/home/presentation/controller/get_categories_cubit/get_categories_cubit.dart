import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repo/home_repo.dart';

import '../../../data/models/category_model.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this._homeRepo) : super(GetCategoriesInitial());
  final HomeRepo _homeRepo;
  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final categoriesOrfailure = await _homeRepo.getCategories();
    categoriesOrfailure.fold(
      (failure) => emit(GetCategoriesError(errMessage: failure.errMessage)),

      (categories) {
        categories.insert(0, const CategoryModel(id: 0, name: 'All'));
        emit(GetCategoriesLoaded(categories: categories));
      },
    );
  }
}
