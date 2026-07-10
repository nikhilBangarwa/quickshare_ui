import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

/// Assumption: exact tab labels were not legible at the wireframe's export
/// resolution — "Smart Post / Library / Communities / Share & Win" is the
/// closest reading. See README for this call-out.
class QuickShareTabs extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int>? onChanged;

  static const List<String> _labels = [
    'Smart Post',
    'Library',
    'Communities',
    'Share & Win',
  ];

  const QuickShareTabs({
    super.key,
    this.activeIndex = 0,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        children: List.generate(_labels.length, (index) {
          final bool active = index == activeIndex;
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onChanged?.call(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _labels[index],
                    textAlign: TextAlign.center,
                    style: active
                        ? AppTextStyles.tabActive
                        : AppTextStyles.tabInactive,
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 2,
                    width: active ? 28 : 0,
                    color: AppColors.primaryGreen,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
