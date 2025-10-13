part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartAdded extends CartState {
  const CartAdded();
}

final class CartAddLoading extends CartState {}

final class CartAddError extends CartState {
  final String errMessage;
  const CartAddError({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final OrderModel orderModel;
  const CartLoaded({required this.orderModel});
  @override
  List<Object> get props => [orderModel];
}

final class CartError extends CartState {
  final String errMessage;
  const CartError({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
