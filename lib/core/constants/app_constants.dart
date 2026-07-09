/// Spacing, radius and sizing constants — kept in one place so layout
/// tweaks don't turn into a find-and-replace across widgets.
class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

class AppRadius {
  AppRadius._();

  static const double sm = 8;
  static const double md = 14;
  static const double lg = 20;
  static const double pill = 100;
}

/// The Figma frame was authored at 375 x 1980 (a tall scrolling artboard).
/// We treat 375 as the reference mobile width for scaling decisions.
class AppBreakpoints {
  AppBreakpoints._();

  static const double mobileReference = 375;
  static const double tablet = 600;
  static const double desktop = 1024;
}
