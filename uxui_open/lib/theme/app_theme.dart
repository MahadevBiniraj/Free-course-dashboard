import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0A0A0A);
  static const cardBackground = Color(0xFF111111);
  static const cardBorder = Color(0xFF1E1E1E);
  static const green = Color(0xFF00C853);
  static const greenLight = Color(0xFF00FF7F);
  static const greenDim = Color(0xFF1A3A2A);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFF888888);
  static const greyLight = Color(0xFFAAAAAA);
  static const greyDark = Color(0xFF333333);
  static const yellow = Color(0xFFFFD700);
}

class AppTextStyles {
  static const heading1 = TextStyle(
    color: AppColors.white,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const heading2 = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const heading3 = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const body = TextStyle(
    color: AppColors.greyLight,
    fontSize: 13,
    height: 1.5,
  );

  static const label = TextStyle(
    color: AppColors.green,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const statNumber = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const statLabel = TextStyle(
    color: AppColors.grey,
    fontSize: 12,
  );
}
