import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

/// Matches the wireframe frames:
///  1) "Open this page when clicked on the caption" -> read-only preview
///  2) "When the user clicks on the caption again, open keyboard to edit"
///     -> tapping the text switches to an editable, focused TextField.
///  3) "Enable Save button when a change is made" -> Save starts disabled
///     and only lights up once the text actually differs from the original.
class EditCaptionSheet extends StatefulWidget {
  final String initialCaption;

  const EditCaptionSheet({super.key, required this.initialCaption});

  @override
  State<EditCaptionSheet> createState() => _EditCaptionSheetState();
}

class _EditCaptionSheetState extends State<EditCaptionSheet> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialCaption);
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final changed = _controller.text != widget.initialCaption;
    if (changed != _hasChanges) {
      setState(() => _hasChanges = changed);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _enterEditMode() {
    if (_isEditing) return;
    setState(() => _isEditing = true);
    // Let the frame build before requesting focus so the keyboard animates in.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
      _controller.selection = TextSelection.collapsed(offset: _controller.text.length);
    });
  }

  Widget _buildRichText(String text) {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 150),
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            const Divider(height: 1, color: AppColors.divider),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: _isEditing
                    ? TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        maxLines: null,
                        autofocus: true,
                        style: AppTextStyles.caption,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      )
                    : GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: _enterEditMode,
                        child: SingleChildScrollView(
                          child: _buildRichText(_controller.text),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, color: AppColors.textPrimary),
          ),
          Expanded(
            child: Text('Edit Caption',
                textAlign: TextAlign.center, style: AppTextStyles.sheetTitle),
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    _hasChanges ? AppColors.primaryGreen : AppColors.divider,
                foregroundColor:
                    _hasChanges ? Colors.white : AppColors.textTertiary,
                disabledBackgroundColor: AppColors.divider,
                disabledForegroundColor: AppColors.textTertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              ),
              onPressed: _hasChanges
                  ? () => Navigator.of(context).pop(_controller.text)
                  : null,
              child: Text('Save', style: AppTextStyles.saveButton.copyWith(
                color: _hasChanges ? Colors.white : AppColors.textTertiary,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
