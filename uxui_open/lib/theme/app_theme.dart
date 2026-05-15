import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0C1210); // Deep Forest Obsidian
  static const cardBackground = Color(0xFF161D1B); // Dark Emerald Surface
  static const cardBorder = Color(0xFF242E2A); // Subtle Forest Border
  static const accent = Color(0xFF10B981); // Emerald (Premium)
  static const accentDeep = Color(0xFF059669); // Deep Emerald
  static const green = Color(0xFF10B981); // Primary Green
  static const greenLight = Color(0xFF34D399); // Soft Mint
  static const greenDim = Color(0xFF064E3B); // Forest Dim
  static const white = Color(0xFFF9FAFB); 
  static const grey = Color(0xFF6B7280); 
  static const greyLight = Color(0xFF9CA3AF);
  static const greyDark = Color(0xFF1F2937);
  static const yellow = Color(0xFFFBBF24);
}

class AppTextStyles {
  static const heading1 = TextStyle(
    color: AppColors.white,
    fontSize: 34,
    fontWeight: FontWeight.w800,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const heading2 = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  );

  static const heading3 = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
  );

  static const body = TextStyle(
    color: AppColors.greyLight,
    fontSize: 15,
    height: 1.6,
  );

  static const label = TextStyle(
    color: AppColors.green,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const statNumber = TextStyle(
    color: AppColors.white,
    fontSize: 32,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.0,
  );

  static const statLabel = TextStyle(
    color: AppColors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
