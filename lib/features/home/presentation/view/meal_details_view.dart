import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/di/service_locator.dart';

import '../../data/models/meal_model.dart';
import '../controller/get_toppings_and_side_optionscubit/get_toppings_and_side_options_cubit.dart';
import '../widgets/meal_details_view_body.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key, required this.meal});
  static const String routeName = 'MealDetailsView';
  final MealModel meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<GetToppingsAndSideOptionsCubit>(),
        child: SafeArea(
          child: SingleChildScrollView(child: MealDetailsViewBody(meal: meal)),
        ),
      ),
    );
  }
}
