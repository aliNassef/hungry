part of 'get_products_cubit.dart';

sealed class GetProductsState extends Equatable {
  const GetProductsState();

  @override
  List<Object> get props => [];
}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsLoaded extends GetProductsState {
  final List<MealModel> meals;

  const GetProductsLoaded({required this.meals});

  @override
  List<Object> get props => [meals];
}

final class GetProductsError extends GetProductsState {
  final String errMessage;

  const GetProductsError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
