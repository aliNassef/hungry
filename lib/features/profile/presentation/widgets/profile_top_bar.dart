import 'package:flutter/material.dart';

class ProfileTopBar extends StatelessWidget {
  const ProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
        Icon(Icons.settings, color: Colors.white),
      ],
    );
  }
}
