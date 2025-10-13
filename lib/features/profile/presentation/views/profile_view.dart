import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/di/service_locator.dart';

import 'package:hungry/features/profile/presentation/controller/profile_cubit/profile_cubit.dart';

import '../widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => injector<ProfileCubit>()..getProfileData(),
        child: ProfileViewBody(),
      ),
    );
  }
}
