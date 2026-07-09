import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized text styles so widgets never hardcode font sizes/weights.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _base => GoogleFonts.inter();

  static TextStyle brandLogo = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.0,
    color: AppColors.textPrimary,
  );

  static TextStyle tabActive = _base.copyWith(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryGreen,
  );

  static TextStyle tabInactive = _base.copyWith(
    fontSize: 12.5,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle badge = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle authorName = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle authorSubtitle = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );

  static TextStyle sectionLabel = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    letterSpacing: 0.2,
  );

  static TextStyle caption = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.45,
  );

  static TextStyle captionHashtag = caption.copyWith(
    color: AppColors.primaryGreenDark,
    fontWeight: FontWeight.w500,
  );

  static TextStyle editCaptionLink = _base.copyWith(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryGreen,
  );

  static TextStyle sheetTitle = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle saveButton = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle navLabel = _base.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.iconInactive,
  );
}
