import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

/// Matches "Content 18-20 / 22-24": a checklist that fills in step by step
/// while the "Smart Posts" are being prepared, ending with a ready message.
/// Shown inline inside [QuickShareScreen] (same page, no route change) while
/// [completedSteps] fills in — this keeps the deliverable a true
/// single-page UI while still covering the loading state from the wireframe.
class SmartPostLoadingView extends StatelessWidget {
  final List<bool> completedSteps;
  final bool allDone;

  static const List<String> stepLabels = [
    'Preparing popular content for you',
    'Crafting a caption to boost engagement',
    'Adding your personal referral link and code',
    'Finding trending songs on other social media',
  ];

  const SmartPostLoadingView({
    super.key,
    required this.completedSteps,
    required this.allDone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.xl, AppSpacing.lg, AppSpacing.xl),
      child: Column(
        children: [
          Text(
            'Building personalised\nSmart Posts for you!',
            textAlign: TextAlign.center,
            style: AppTextStyles.sheetTitle.copyWith(fontSize: 18),
          ),
          const SizedBox(height: AppSpacing.lg),
          ...List.generate(stepLabels.length, (i) {
            return _StepRow(
              label: stepLabels[i],
              done: completedSteps[i],
            );
          }),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: allDone
                ? Padding(
              key: const ValueKey('ready'),
              padding: const EdgeInsets.only(top: AppSpacing.md),
              child: Text(
                'All set! Get ready to share...',
                style: AppTextStyles.sectionLabel.copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColors.primaryGreenDark,
                ),
              ),
            )
                : const SizedBox.shrink(key: ValueKey('pending')),
          ),
        ],
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final String label;
  final bool done;

  const _StepRow({required this.label, required this.done});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: done ? AppColors.primaryGreen : Colors.transparent,
              border: Border.all(
                color: done ? AppColors.primaryGreen : AppColors.divider,
                width: 1.5,
              ),
            ),
            child: done
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: done ? AppColors.textPrimary : AppColors.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}