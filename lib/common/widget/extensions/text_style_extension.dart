import 'package:flutter/material.dart';
import 'package:nex_live_chat/theme/app_colors.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get thin => weight(FontWeight.w100);

  TextStyle get extraLight => weight(FontWeight.w200);

  TextStyle get light => weight(FontWeight.w300);

  TextStyle get regular => weight(FontWeight.w400);

  TextStyle get medium => weight(FontWeight.w500);

  TextStyle get semiBold => weight(FontWeight.w600);

  TextStyle get bold => weight(FontWeight.w700);

  TextStyle get extraBold => weight(FontWeight.w800);

  TextStyle get italic => fontStyleT(FontStyle.italic);

  TextStyle get normal => fontStyleT(FontStyle.normal);

  TextStyle get fontSVNText => copyWith(fontFamily: 'svn_text');

  TextStyle size(double size) => copyWith(fontSize: size);

  TextStyle textColor(Color v) => copyWith(color: v);

  TextStyle weight(FontWeight v) => copyWith(fontWeight: v);

  TextStyle fontStyleT(FontStyle v) => copyWith(fontStyle: v);

  TextStyle setDecoration(TextDecoration v) => copyWith(decoration: v);

  TextStyle letterSpaC(double v) => copyWith(letterSpacing: v);

  TextStyle heightLine(double v) => copyWith(height: v / fontSize!);

  TextStyle get decorationUnderline => setDecoration(TextDecoration.underline);

  TextStyle get decorationLineThrough => setDecoration(TextDecoration.lineThrough);

  TextStyle get textWhite => copyWith(color: Colors.white);

  TextStyle get textPrimary => copyWith(color: AppColors.primary);

  TextStyle get text9196A1 => copyWith(color: Colors.grey);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.combine([TextDecoration.lineThrough]));
}
