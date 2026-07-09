import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class QuickShareBottomNav extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int>? onChanged;

  static const List<IconData> _icons = [
    Icons.ios_share_rounded,
    Icons.search_rounded,
    Icons.home_rounded,
    Icons.forum_outlined,
    Icons.person_outline_rounded,
  ];

  const QuickShareBottomNav({
    super.key,
    this.activeIndex = 2,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 56,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.divider)),
        ),
        child: Row(
          children: List.generate(_icons.length, (i) {
            final bool active = i == activeIndex;
            return Expanded(
              child: InkWell(
                onTap: () => onChanged?.call(i),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _icons[i],
                      color: active
                          ? AppColors.primaryGreen
                          : AppColors.iconInactive,
                      size: 22,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: active
                            ? AppColors.primaryGreen
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
