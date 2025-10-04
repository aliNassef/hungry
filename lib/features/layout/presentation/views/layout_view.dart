import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../home/presentation/view/home_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static const routeName = 'layout-view';

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomeView(),
          item: ItemConfig(
            activeForegroundColor: AppColors.light,
            activeColorSecondary: AppColors.light,
            icon: FaIcon(FontAwesomeIcons.houseChimney),
          ),
        ),
        PersistentTabConfig(
          screen: Container(),
          item: ItemConfig(
            activeForegroundColor: AppColors.light,
            activeColorSecondary: AppColors.light,
            icon: FaIcon(FontAwesomeIcons.cartShopping),
          ),
        ),

        PersistentTabConfig(
          screen: Container(),
          item: ItemConfig(
            activeForegroundColor: AppColors.light,
            activeColorSecondary: AppColors.light,
            icon: FaIcon(FontAwesomeIcons.user),
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,

        height: kBottomNavigationBarHeight,
        navBarDecoration: NavBarDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
      ),
    );
  }
}
