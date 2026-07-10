import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

/// Top bar: Matches Figma wireframe with Your Assistant (AI-badged), Oriflame Sweden logo, and Camera button.
class QuickShareTopBar extends StatelessWidget implements PreferredSizeWidget {
  const QuickShareTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        height: preferredSize.height,
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left: Your Assistant
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 80,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFF222222),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ),
                        // AI green pill on top-right
                        Positioned(
                          top: -2,
                          right: -8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'AI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Your Assistant',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Center: Oriflame Sweden Logo
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ORIFLAME',
                  style: AppTextStyles.brandLogo.copyWith(
                    fontSize: 15,
                    letterSpacing: 2.5,
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 70,
                  height: 0.6,
                  color: AppColors.textPrimary.withValues(alpha: 0.25),
                ),
                const SizedBox(height: 3),
                const Text(
                  'SWEDEN',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 7.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 4.0,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),

            // Right: Camera
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 80,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Color(0xFF222222),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(82);
}
