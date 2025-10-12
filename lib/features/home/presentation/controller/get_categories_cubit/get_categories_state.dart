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

  const GetCategoriesLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class GetCategoriesError extends GetCategoriesState {
  final String errMessage;

  const GetCategoriesError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
