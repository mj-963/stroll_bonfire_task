import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_bonfire_task/utils/app_colors.dart';

class BonfireFooter extends ConsumerWidget {
  const BonfireFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        // Instructions text
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Text(
            'Pick your option.\nSee who has a similar mind.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 13,
              height: 1.3,
            ),
          ),
        ),
        const Spacer(),
        // Bottom action buttons
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildCircleButton(
                icon: SvgPicture.asset(
                  'assets/icons/mic_2.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryDark,
                    BlendMode.srcIn,
                  ),
                  height: 20,
                  width: 20,
                  clipBehavior: Clip.antiAlias,
                  fit: BoxFit.scaleDown,
                ),
                backgroundColor: AppColors.primaryDark,
                showBackground: false,
              ),
              const SizedBox(width: 12),
              _buildCircleButton(
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.backgroundDark,
                ),
                backgroundColor: AppColors.primaryDark,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircleButton({
    required Widget icon,
    required Color backgroundColor,
    bool showBackground = true,
  }) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: showBackground ? backgroundColor : null,
        border: Border.all(
          color: backgroundColor,
          width: 2,
        ),
      ),
      child: icon,
    );
  }
}
