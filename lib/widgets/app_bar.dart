import 'package:flutter/material.dart';
import 'package:stroll_bonfire_task/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Stroll Bonfire",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: AppColors.primary,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.timer,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              "22h 00m",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(width: 16),
            Icon(
              Icons.group,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              "103",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
