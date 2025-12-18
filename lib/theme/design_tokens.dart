// 🐦 Flutter imports:
import 'package:flutter/material.dart';

/// Centralized design tokens used across the app.
///
/// Keep values source-of-truth here so widgets can stay consistent with the
/// design system without redefining ad-hoc colors or sizes.
final class AppColors {
  const AppColors._();

  static const Color black = Color(0xFF000000);
  static const Color black10 = Color(0x1A000000); // 10% opacity
  static const Color white = Color(0xFFFFFFFF);

  static const Color athensGray = Color(0xFFE5E7EB);
  static const Color wildWatermelon = Color(0xFFFF558F);
  static const Color osloGray = Color(0xFF868E96);
  static const Color crimson = Color(0xFFED1515);

  static const Color gradientStart = Color(0xFFFF8260);
  static const Color gradientEnd = Color(0xFFF50057);
}

final class AppSpacing {
  const AppSpacing._();

  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
}

final class AppRadius {
  const AppRadius._();

  static const double xs = 4;
  static const double md = 12;
}

final class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle bannerLabel = TextStyle(
    fontSize: 13.9,
    fontWeight: FontWeight.w600,
    height: 20 / 13.9,
    letterSpacing: -0.3,
    color: AppColors.white,
  );

  static const TextStyle bannerMeta = TextStyle(
    fontSize: 11.8,
    fontWeight: FontWeight.w400,
    height: 16 / 11.8,
    letterSpacing: -0.3,
    color: AppColors.white,
  );

  static const TextStyle metaAccent = TextStyle(
    fontSize: 11.8,
    fontWeight: FontWeight.w600,
    height: 16 / 11.8,
    letterSpacing: -0.3,
    color: AppColors.wildWatermelon,
  );

  static const TextStyle title = TextStyle(
    fontSize: 15.9,
    fontWeight: FontWeight.w600,
    height: 24 / 15.9,
    letterSpacing: -0.3,
    color: AppColors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 11.8,
    fontWeight: FontWeight.w600,
    height: 16 / 11.8,
    letterSpacing: -0.3,
    color: AppColors.osloGray,
  );

  static const TextStyle chipLabel = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 15 / 10,
    letterSpacing: 0,
  );
}
