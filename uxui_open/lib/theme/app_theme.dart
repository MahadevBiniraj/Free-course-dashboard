import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF09090B); // Deep Obsidian Slate
  static const cardBackground = Color(0xFF121214); // Layered Surface
  static const cardBorder = Color(0xFF202023); // Sharp, Minimal Border
  static const accent = Color(0xFF2ACB65); // Updated Brand Green
  static const accentDeep = Color(0xFF16A34A); 
  static const green = Color(0xFF2ACB65); 
  static const greenLight = Color(0xFF86EFAC); 
  static const greenDim = Color(0xFF14532D); 
  static const white = Color(0xFFFAFAFA); 
  static const grey = Color(0xFF71717A); 
  static const greyLight = Color(0xFFA1A1AA); 
  static const greyDark = Color(0xFF27272A);
  static const yellow = Color(0xFFFACC15);
}

class AppTextStyles {
  static const heading1 = TextStyle(
    color: AppColors.white,
    fontSize: 34,
    fontWeight: FontWeight.w800,
    height: 1.2,
    letterSpacing: -0.5,
    fontFamily: 'Lufga',
  );

  static const heading2 = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    fontFamily: 'Lufga',
  );

  static const heading3 = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    fontFamily: 'Lufga',
  );

  static const body = TextStyle(
    color: AppColors.greyLight,
    fontSize: 15,
    height: 1.6,
    fontFamily: 'Lufga',
  );

  static const label = TextStyle(
    color: Color.fromARGB(255, 42, 203, ,
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
