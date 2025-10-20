import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../controller/get_categories_cubit/get_categories_cubit.dart';

import '../controller/get_products_cubit/get_products_cubit.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => injector<GetCategoriesCubit>()),
          BlocProvider(create: (context) => injector<GetProductsCubit>()),
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
