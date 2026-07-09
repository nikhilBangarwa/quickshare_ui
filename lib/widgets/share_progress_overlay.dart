import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

/// Matches the "Content 4 / Content 5" wireframe frames: after the user taps
/// a quick-share platform, a small card walks through a few prep steps with
/// an animated progress bar, then hands off to a platform confirmation
/// screen before auto-dismissing. No real network/share intent is fired —
/// this is a UI-only simulation per the assignment's "hardcoded values" note.
class ShareProgressOverlay extends StatefulWidget {
  final String platformLabel;

  const ShareProgressOverlay({super.key, required this.platformLabel});

  static Future<void> show(BuildContext context, String platformLabel) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black45,
      builder: (_) => ShareProgressOverlay(platformLabel: platformLabel),
    );
  }

  @override
  State<ShareProgressOverlay> createState() => _ShareProgressOverlayState();
}

class _ShareProgressOverlayState extends State<ShareProgressOverlay>
    with SingleTickerProviderStateMixin {
  static const _steps = [
    'Generating your sales link..',
    'Copying the caption to clipboard',
    'Saving the content to your profile',
    'Preparing the content for social media',
  ];

  late final AnimationController _controller;
  int _stepIndex = 0;
  bool _showHandoff = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addStatusListener(_onStatusChanged);
    _controller.forward();
  }

  void _onStatusChanged(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;
    if (_stepIndex < _steps.length - 1) {
      setState(() => _stepIndex++);
      _controller.forward(from: 0);
    } else {
      setState(() => _showHandoff = true);
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) Navigator.of(context).pop();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _showHandoff
            ? _HandoffCard(platformLabel: widget.platformLabel)
            : _ProgressCard(
          key: ValueKey(_stepIndex),
          label: _steps[_stepIndex],
          controller: _controller,
        ),
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final String label;
  final AnimationController controller;

  const _ProgressCard({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RotationTransition(
            turns: controller,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: AppColors.primaryGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.refresh_rounded,
                  color: Colors.white, size: 24),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(label, textAlign: TextAlign.center, style: AppTextStyles.sectionLabel),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) => LinearProgressIndicator(
                value: controller.value,
                minHeight: 5,
                backgroundColor: AppColors.divider,
                valueColor: const AlwaysStoppedAnimation(AppColors.primaryGreen),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HandoffCard extends StatelessWidget {
  final String platformLabel;
  const _HandoffCard({required this.platformLabel});

  @override
  Widget build(BuildContext context) {
    return _Card(
      key: const ValueKey('handoff'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.md),
              gradient: const LinearGradient(
                colors: AppColors.socialGradientInstagram,
              ),
            ),
            child: const Icon(Icons.camera_alt_rounded,
                color: Colors.white, size: 26),
          ),
          const SizedBox(height: AppSpacing.md),
          Text('Opening $platformLabel...', style: AppTextStyles.sheetTitle),
          const SizedBox(height: AppSpacing.xs),
          Text('from Meta', style: AppTextStyles.navLabel),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.lg, horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}