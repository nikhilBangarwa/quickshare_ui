import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import 'share_progress_overlay.dart';

class _SocialTarget {
  final IconData icon;
  final Color? color;
  final Gradient? gradient;
  final String label;

  const _SocialTarget({
    required this.icon,
    required this.label,
    this.color,
    this.gradient,
  });
}

/// Row of quick-share destinations. Tapping a circle triggers the
/// [ShareProgressOverlay] simulation — wiring real share intents is out of
/// scope per the assignment brief (UI-focused, hardcoded values, no
/// backend/API work).
class SocialShareRow extends StatelessWidget {
  const SocialShareRow({super.key});

  static final List<_SocialTarget> _targets = [
    _SocialTarget(
      icon: Icons.camera_alt_rounded,
      label: 'Instagram',
      gradient: const LinearGradient(colors: AppColors.socialGradientInstagram),
    ),
    _SocialTarget(
      icon: Icons.facebook_rounded,
      label: 'Facebook',
      color: AppColors.facebookBlue,
    ),
    _SocialTarget(
      icon: Icons.send_rounded,
      label: 'Messenger',
      color: AppColors.messengerBlue,
    ),
    _SocialTarget(
      icon: Icons.chat_bubble_rounded,
      label: 'WhatsApp',
      color: AppColors.whatsappGreen,
    ),
    _SocialTarget(
      icon: Icons.push_pin_rounded,
      label: 'Pinterest',
      color: AppColors.pinterestRed,
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
    return Column(
      children: [
        InkWell(
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
            child: Icon(target.icon, color: Colors.white, size: 22),
          ),
        ),
      ],
    );
  }
}
