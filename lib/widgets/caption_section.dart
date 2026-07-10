import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import 'edit_caption_sheet.dart';


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

  Widget _buildRichCaption(String text) {
    final List<TextSpan> spans = [];
    final RegExp regExp = RegExp(r'(\s+)');
    final List<String> parts = text.split(regExp);

    for (final part in parts) {
      if (part.startsWith('#')) {
        spans.add(TextSpan(
          text: part,
          style: AppTextStyles.captionHashtag,
        ));
      } else if (part.startsWith('http://') || part.startsWith('https://')) {
        spans.add(TextSpan(
          text: part,
          style: AppTextStyles.editCaptionLink.copyWith(fontSize: 13),
        ));
      } else {
        spans.add(TextSpan(
          text: part,
          style: AppTextStyles.caption,
        ));
      }
    }

    return Text.rich(
      TextSpan(children: spans),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
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
            child: _buildRichCaption(caption),
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
