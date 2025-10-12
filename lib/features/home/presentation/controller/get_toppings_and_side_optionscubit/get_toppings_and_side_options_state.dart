part of 'get_toppings_and_side_options_cubit.dart';

sealed class GetToppingsAndSideOptionsState extends Equatable {
  const GetToppingsAndSideOptionsState();

  @override
  List<Object> get props => [];
}

final class GetToppingsAndSideOptionsInitial
    extends GetToppingsAndSideOptionsState {}

final class GetToppingsLoading extends GetToppingsAndSideOptionsState {}

final class GetToppingsLoaded extends GetToppingsAndSideOptionsState {
  final List<ToppingModel> toppings;

  const GetToppingsLoaded({required this.toppings});

  @override
  List<Object> get props => [toppings];
}

final class GetToppingsError extends GetToppingsAndSideOptionsState {
  final String errMessage;

  const GetToppingsError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}

final class GetSideOptionsLoading extends GetToppingsAndSideOptionsState {}

final class GetSideOptionsLoaded extends GetToppingsAndSideOptionsState {
  final List<SlideOptionModel> sideOptions;

  const GetSideOptionsLoaded({required this.sideOptions});

  @override
  List<Object> get props => [sideOptions];
}

final class GetSideOptionsError extends GetToppingsAndSideOptionsState {
  final String errMessage;

  const GetSideOptionsError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
