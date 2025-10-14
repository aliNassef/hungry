import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dilagos.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../data/models/profile_model.dart';
import '../controller/profile_cubit/profile_cubit.dart';

class UpdateProfileButtonBlocListener extends StatelessWidget {
  const UpdateProfileButtonBlocListener({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController addressController,
    required File? pickedImage,
  }) : _nameController = nameController,
       _emailController = emailController,
       _addressController = addressController,
       _pickedImage = pickedImage;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _addressController;
  final File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is ProfileUpdateFailure ||
          current is ProfileUpdateSuccess ||
          current is ProfileUpdateLoading,
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          AppNavigation.pop(context, useAppRoute: true);
          AppDilagos.showToast(text: 'PROFILE UPDATED SUCCESSFULLY');
        }
        if (state is ProfileUpdateFailure) {
          AppNavigation.pop(context, useAppRoute: true);
          AppDilagos.showErrorMessage(context, errMessage: state.errMessage);
        }
        if (state is ProfileUpdateLoading) {
          AppDilagos.showLoadingBox(context);
        }
      },
      child: DefaultAppButton(
        onPressed: () {
          var profile = ProfileModel(
            name: _nameController.text.trim(),
            email: _emailController.text.trim(),
            address: _addressController.text.trim(),
            imageFile: _pickedImage,
          );
          context.read<ProfileCubit>().updateProfileData(profile);
        },
        text: 'Edit Profile',
        textColor: AppColors.primary,
        backgroundColor: AppColors.light,
        icon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(Icons.edit_note, color: AppColors.primary, size: 32.sp),
        ),
      ),
    );
  }
}
