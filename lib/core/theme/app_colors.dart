import 'package:flutter/material.dart';

/// Colors picked/approximated from the Oriflame "Quick Share" Figma wireframe.
/// See README.md -> "Design decisions" for notes on where values were
/// approximated because the wireframe screenshots didn't expose exact hex codes.
class AppColors {
  AppColors._();

  // Brand
  static const Color primaryGreen = Color(0xFF0F9D7C);
  static const Color primaryGreenDark = Color(0xFF0B7A61);
  static const Color accentPink = Color(0xFFE23E8C);

  // Neutrals
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color scrim = Color(0x99000000);

  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6E6E6E);
  static const Color textTertiary = Color(0xFF9B9B9B);

  static const Color divider = Color(0xFFECECEC);
  static const Color iconInactive = Color(0xFF8A8A8A);

  // Social platform swatches (approximate brand colors for the quick-share row)
  static const List<Color> socialGradientInstagram = [
    Color(0xFFF9CE34),
    Color(0xFFEE2A7B),
    Color(0xFF6228D7),
  ];
  static const Color facebookBlue = Color(0xFF1877F2);
  static const Color messengerBlue = Color(0xFF2AABEE);
  static const Color whatsappGreen = Color(0xFF25D366);
  static const Color pinterestRed = Color(0xFFE60023);
}
