part of 'get_categories_cubit.dart';

sealed class GetCategoriesState extends Equatable {
  const GetCategoriesState();

  @override
  List<Object> get props => [];
}

final class GetCategoriesInitial extends GetCategoriesState {}

final class GetCategoriesLoading extends GetCategoriesState {}

final class GetCategoriesLoaded extends GetCategoriesState {
  final List<CategoryModel> categories;
  final int selectedCategoryIndex;

  const GetCategoriesLoaded({
    required this.categories,
    this.selectedCategoryIndex = 0,
  });

  GetCategoriesLoaded copyWith({int? selectedCategoryIndex}) {
    return GetCategoriesLoaded(
      categories: categories,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }

  @override
  List<Object> get props => [categories, selectedCategoryIndex];
}

final class GetCategoriesError extends GetCategoriesState {
  final String errMessage;

  const GetCategoriesError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
