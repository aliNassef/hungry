import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/helpers/image_picker_helper.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../controller/profile_cubit/profile_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_shadwo.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import 'logout_button_bloc_listener.dart';
import 'profile_top_bar.dart';
import 'update_profile_button_bloc_listener.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _passwordController;
  File? _pickedImage;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: context.height,
      width: context.width,
      color: AppColors.primary,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (_, current) =>
            current is ProfileLoaded ||
            current is ProfileLoading ||
            current is ProfileFailure,
        builder: (context, state) {
          if (state is ProfileFailure) {
            return CustomFailureWidget(message: state.errMessage);
          }

          if (state is ProfileLoading) {
            return _buildProfileLoading();
          }
          if (state is ProfileLoaded) {
            _nameController.text = state.profile.name;
            _emailController.text = state.profile.email;
            _addressController.text = state.profile.address ?? '';
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Gap(16.h),
                  const ProfileTopBar(),
                  Gap(24.h),
                  _buildProfileImage(state),
                  Gap(32.h),
                  CustomTextFormField(
                    controller: _nameController,
                    label: 'Name',
                    hint: state.profile.name,
                  ),
                  Gap(32.h),
                  CustomTextFormField(
                    controller: _emailController,
                    label: 'Email',
                    hint: state.profile.email,
                  ),
                  Gap(32.h),
                  CustomTextFormField(
                    controller: _addressController,
                    label: 'Delivery address',
                    hint: state.profile.address ?? 'No address yet',
                  ),

                  Gap(32.h),
                  CustomTextFormField(
                    controller: _passwordController,
                    label: 'Password',
                    hint: '********',
                  ),
                  Gap(32.h),
                  Divider(
                    color: AppColors.light,
                    thickness: 1.h,
                    indent: 24.w,
                    endIndent: 24.w,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: UpdateProfileButtonBlocListener(
                          nameController: _nameController,
                          emailController: _emailController,
                          addressController: _addressController,
                          pickedImage: _pickedImage,
                        ),
                      ),
                      Gap(16.w),
                      const Expanded(child: LogoutButtonBloclistener()),
                    ],
                  ),
                  Gap(30.w),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  GestureDetector _buildProfileImage(ProfileLoaded state) {
    return GestureDetector(
      onTap: () {
        _pickImage();
      },
      child: _pickedImage == null
          ? CustomNetworkImage(
              img:
                  state.profile.image ??
                  'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png',
              width: 120.w,
              height: 120.h,
              radius: 12.r,
              fit: BoxFit
                  .cover, // Use BoxFit.cover to match DecorationImage's default
            )
          : Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [AppShadwo.boxShadwo3],
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  onError: (exception, stackTrace) {
                    // This doesn't show a fallback UI
                  },
                  fit: BoxFit.cover,
                  image: FileImage(_pickedImage!),
                ),
              ),
            ),
    );
  }

  void _pickImage() {
    ImagePickerHelper().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        setState(() {
          _pickedImage = File(value.path);
        });
      }
    });
  }

  Skeletonizer _buildProfileLoading() {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Gap(16.h),
          const ProfileTopBar(),
          Gap(24.h),
          Container(
            height: 120.h,
            width: 120.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [AppShadwo.boxShadwo3],
              borderRadius: BorderRadius.circular(12.r),
              image: const DecorationImage(
                image: AssetImage(AppImages.splashBurger),
              ),
            ),
          ),
          Gap(32.h),
          const CustomTextFormField(label: 'Name', hint: 'John Doe'),
          Gap(32.h),
          const CustomTextFormField(label: 'Email', hint: 'John Doe'),
          Gap(32.h),
          const CustomTextFormField(
            label: 'Delivery address',
            hint: 'John Doe',
          ),
          Gap(32.h),
          const CustomTextFormField(label: 'Password', hint: 'John Doe'),
          Gap(32.h),
          Divider(
            color: AppColors.light,
            thickness: 1.h,
            indent: 24.w,
            endIndent: 24.w,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: DefaultAppButton(
                  text: 'Edit Profile',
                  textColor: AppColors.primary,
                  backgroundColor: AppColors.light,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.edit_note,
                      color: AppColors.primary,
                      size: 32.sp,
                    ),
                  ),
                ),
              ),
              Gap(16.w),
              Expanded(
                child: DefaultAppButton(
                  text: 'Log out',
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.logout,
                      color: AppColors.light,
                      size: 32.sp,
                    ),
                  ),
                  borderColor: AppColors.light,
                  borderWidth: 3.w,
                ),
              ),
            ],
          ),
          Gap(30.w),
        ],
      ),
    );
  }
}
