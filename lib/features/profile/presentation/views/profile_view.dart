import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';

import '../controller/profile_cubit/profile_cubit.dart';

import '../widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => injector<ProfileCubit>()..getProfileData(),
        child: const ProfileViewBody(),
      ),
    );
  }
}
