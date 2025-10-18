part of 'get_orders_history_cubit.dart';

sealed class GetOrdersHistoryState extends Equatable {
  const GetOrdersHistoryState();

  @override
  List<Object> get props => [];
}

final class GetOrdersHistoryInitial extends GetOrdersHistoryState {}

final class GetOrdersHistoryLoading extends GetOrdersHistoryState {}

final class GetOrdersHistoryLoaded extends GetOrdersHistoryState {
  final List<OrderHistoryModel> orders;
  const GetOrdersHistoryLoaded({required this.orders});
  @override
  List<Object> get props => [orders];
}

final class GetOrdersHistoryFailure extends GetOrdersHistoryState {
  final String errMessage;
  const GetOrdersHistoryFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
