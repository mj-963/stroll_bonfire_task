import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_bonfire_task/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Stroll Bonfire",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 2),
                      blurRadius: 8.0,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ]),
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
            SvgPicture.asset(
              'assets/icons/timer.svg',
              height: 16,
              width: 16,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              "22h 00m",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 16),
            SvgPicture.asset(
              'assets/icons/user.svg',
              height: 20,
              width: 20,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
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
