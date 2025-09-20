import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Colors.pinkAccent;
  static const Color secondary = Colors.white;
  
  // Background Colors
  static Color backgroundDark = Colors.black.withValues(alpha: 0.8);
  static Color backgroundLight = Colors.white.withValues(alpha: 0.1);
  static Color backgroundCard = Colors.white.withValues(alpha: 0.1);
  
  // Text Colors
  static const Color textPrimary = Colors.white;
  static Color textSecondary = Colors.white.withValues(alpha: 0.7);
  static Color textTertiary = Colors.white.withValues(alpha: 0.6);
  
  // Border Colors
  static Color borderPrimary = Colors.white.withValues(alpha: 0.2);
  static Color borderSecondary = Colors.white.withValues(alpha: 0.3);
  
  // Shadow Colors
  static Color shadowPrimary = Colors.black.withValues(alpha: 0.3);
  static Color shadowSecondary = Colors.black.withValues(alpha: 0.5);
  
  // Overlay Colors
  static Color overlayLight = Colors.white.withValues(alpha: 0.1);
  static Color overlayMedium = Colors.white.withValues(alpha: 0.2);
}
