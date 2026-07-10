import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import 'share_progress_overlay.dart';

class _SocialTarget {
  final Widget iconWidget;
  final String label;
  final Color? color;
  final Gradient? gradient;

  const _SocialTarget({
    required this.iconWidget,
    required this.label,
    this.color,
    this.gradient,
  });
}

class SocialShareRow extends StatelessWidget {
  const SocialShareRow({super.key});

  static final List<_SocialTarget> _targets = [
    _SocialTarget(
      label: 'Instagram',
      gradient: const LinearGradient(colors: AppColors.socialGradientInstagram),
      iconWidget: Center(
        child: Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
              ),
              Positioned(
                top: 1.5,
                right: 1.5,
                child: Container(
                  width: 2.0,
                  height: 2.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    const _SocialTarget(
      iconWidget: Icon(Icons.facebook_rounded, color: Colors.white, size: 24),
      label: 'Facebook',
      color: AppColors.facebookBlue,
    ),
    const _SocialTarget(
      iconWidget: Icon(Icons.send_rounded, color: Colors.white, size: 22),
      label: 'Messenger',
      color: AppColors.messengerBlue,
    ),
    _SocialTarget(
      label: 'WhatsApp',
      color: AppColors.whatsappGreen,
      iconWidget: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 24),
            Container(
              margin: const EdgeInsets.only(bottom: 2, right: 1),
              child: const Icon(Icons.phone, color: AppColors.whatsappGreen, size: 12),
            ),
          ],
        ),
      ),
    ),
    _SocialTarget(
      label: 'Pinterest',
      color: AppColors.pinterestRed,
      iconWidget: Center(
        child: Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              'p',
              style: TextStyle(
                color: AppColors.pinterestRed,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                fontFamily: 'serif',
              ),
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.md, AppSpacing.lg, AppSpacing.md, AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('QUICK SHARE TO', style: AppTextStyles.sectionLabel),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _targets.map((t) => _SocialCircle(target: t)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SocialCircle extends StatelessWidget {
  final _SocialTarget target;
  const _SocialCircle({required this.target});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.pill),
      onTap: () => ShareProgressOverlay.show(context, target.label),
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: target.color,
          gradient: target.gradient,
          shape: BoxShape.circle,
        ),
        child: target.iconWidget,
      ),
    );
  }
}
