import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repo/order_history_repo.dart';

import '../../../data/models/order_history_model.dart';

part 'get_orders_history_state.dart';

class GetOrdersHistoryCubit extends Cubit<GetOrdersHistoryState> {
  GetOrdersHistoryCubit(this._orderHistoryRepo) : super(GetOrdersHistoryInitial());
  final OrderHistoryRepo _orderHistoryRepo;

  void getOrdersHistory() async {
    emit(GetOrdersHistoryLoading());
    final result = await _orderHistoryRepo.getOrderHistory();
    result.fold(
      (failure) => emit(GetOrdersHistoryFailure(errMessage: failure.errMessage)),
      (orders) => emit(GetOrdersHistoryLoaded(orders: orders)),
    );
  }
}
