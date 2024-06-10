// ignore: file_names
import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:fake_store/theme/themes/themeText.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(
  chipTheme:  ChipThemeData(
    labelStyle: textTheme.bodyMedium,
    backgroundColor: ColorCollection.background,
    selectedColor: ColorCollection.input,

  ),
  scaffoldBackgroundColor: ColorCollection.background,
    useMaterial3: true,
    textTheme: textTheme);