part of 'checkout_cubit.dart';

sealed class CheckoutState {
  const CheckoutState();
}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {}

final class CheckoutFailure extends CheckoutState {
  final String errMessage;

  const CheckoutFailure({required this.errMessage});
}
