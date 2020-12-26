import 'package:flutter/material.dart';

/// App Colors Class - Resource class for storing app level color constants
class AppColors {
  static const Color PRIMARY_COLOR = Color(0xFF35B4C5);
  static const Color PRIMARY_COLOR_LIGHT = Color(0xFFA5CFF1);
  static const Color PRIMARY_COLOR_DARK = Color(0xFF0D3656);
  static const Color ACCENT_COLOR = Color(0xFFF2DA04);
  static const Color SELECTED_INDICATOR_COLOR = Color(0xFF4F4F4F);
  static const Color WHITE_COLOR = Color(0xFFFFFFFF);
  static const Color PRIMARY_TEXT_COLOR = Color(0xFF4F4F4F);
  static const Color SHADOW_COLOR = Color(0x28000000);
  static const Color TEXT_LIGHT_COLOR = Color(0xFF8E8E93);
  static const Color LIGHT_COLOR = Color(0xFF4F4F4F); //#4F4F4F
  static const Color LIGHT_GRAY = Color(0xFFE0E0E0); //#E0E0E0
  static const Color LIGHT_BOX_GRAY = Color(0xFFF1F1F1); //#F1F1F1
  static const Color LIGHT_GRAY_TEXT = Color(0xFFBDBDBD); //#BDBDBD
  static const Color BG_COLOR = Color(0xFFE5E5E5); //#E5E5E5
  static const Color LIGHT_GREY_BACKGROUND = Color(0xFFF4F4F4);
  static const Color LIGHT_BACKGROUND = Color(0xFFE5E5E5);
  static const Color BLACK = Color(0xFF071341);
  static const Color GREY = Color(0xFFD0D0D0);
  static const Color DARK_BLACK = Color(0xff222222);
  static const Color LIGHT_BLACK = Color(0xff4F4F4F);
  static const Color GREY_BLACK = Color(0xff000D3D);
  static const Color PFM_APP_BAR_COLOR = Color(0xff0A0B24);
  static const Color gradient_start = Color(0xffC94071);
  static const Color gradient_end = Color(0xffFF7D34);
  static const Color PFM_CIRCULAR_INDICATOR = Color(0x800A0B24);
  static const Color LIGHT_GREY_TEXT = Color(0xFF323232);
  static const Color regular = Color(0xFF4F4F4F);
  static const Color light = Color(0xFF333333);
  static const Color dark = Color(0xFF121212);
  static const Color accent = Color(0xFFF6F7F8);
  static const Color activeLight = Color(0xFFF39C05);
  static const Color activeDark = Color(0xFFE19106);
  static const Color error = Color(0xFFFF4848);
  static const Color currency = Color(0xff000D3D);
  static const Color ultraLight = Color(0xFF828282);
  static const Color success = Color(0xFF27AE60);
  static const Color container_next = Color(0xFFF4EEE6);
  static const Color profile_slab_background = Color(0xFFF5F6F7);
  static const Color bank_statement_subHeading = Color(0xFF727272);
  static const Color red_dr_color = Color(0xFFCB0808);
  static const Color green_cr_color = Color(0xFF219653);
  static const Color dashboard_slab_gradient_1 = Color(0xFFFE7C36);
  static const Color dashboard_slab_gradient_2 = Color(0xFFD64E63);
  static const Color grey_orange = Color(0xFFE2994A);
  static const Color no_history_text_color = Color(0xFF455A64);
  static const Color dashboard_dropdown_bg = Color(0xFFFEF5E6);
  static const Color gray_color = Color(0xFFB6B6B6);
  static const Color transparent = Color(0x00000000);
}

class AlphabetColors {
  Color colorFor(String alphabet) {
    if (alphabet == null || alphabet.length != 1) {
      return AppColors.regular;
    }

    switch (alphabet) {
      case 'A':
        return Color(0xFF00C9A7);
      case 'B':
        return Color(0xFF845EC2);
      case 'C':
        return Color(0xFFD65DB1);
      case 'D':
        return Color(0xFF2C73D2);
      case 'E':
        return Color(0xFF008E9B);
      case 'F':
        return Color(0xFF4D8076);
      case 'G':
        return Color(0xFF4B4453);
      case 'H':
        return Color(0xFFC34A36);
      case 'I':
        return Color(0xFF4E8397);
      case 'J':
        return Color(0xFF3C859E);
      case 'K':
        return Color(0xFFBC39B1);
      case 'L':
        return Color(0xFFD03B29);
      case 'M':
        return Color(0xFFA178DF);
      case 'N':
        return Color(0xFF3E207C);
      case 'O':
        return Color(0xFF009EFA);
      case 'P':
        return Color(0xFF0A7D94);
      case 'Q':
        return Color(0xFF3D9A8A);
      case 'R':
        return Color(0xFFF39C05);
      case 'S':
        return Color(0xFFFF5F00);
      case 'T':
        return Color(0xFF37474F);
      case 'U':
        return Color(0xFF000000);
      case 'V':
        return Color(0xFF333333);
      case 'W':
        return Color(0xFFFF5A5A);
      case 'X':
        return Color(0xFF55A0DC);
      case 'Y':
        return Color(0xFFB61083);
      case 'Z':
        return Color(0xFF7F8A8F);
      default:
        return AppColors.regular;
    }
  }
}
