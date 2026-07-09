import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import 'edit_caption_sheet.dart';

/// Caption preview shown under the post card. Tapping it (or the
/// "Edit Caption" link) opens the Edit Caption bottom sheet in read-only
/// mode first — tapping the text again inside the sheet reveals the
/// keyboard, matching the two-step interaction called out in the wireframe.
class CaptionSection extends StatelessWidget {
  final String caption;
  final ValueChanged<String> onCaptionSaved;

  const CaptionSection({
    super.key,
    required this.caption,
    required this.onCaptionSaved,
  });

  Future<void> _openEditSheet(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => EditCaptionSheet(initialCaption: caption),
    );
    if (result != null) onCaptionSaved(result);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.md, AppSpacing.md, AppSpacing.md, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => _openEditSheet(context),
            child: Text(
              caption,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          GestureDetector(
            onTap: () => _openEditSheet(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.edit_outlined,
                    size: 14, color: AppColors.primaryGreen),
                const SizedBox(width: 4),
                Text('Edit Caption', style: AppTextStyles.editCaptionLink),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
