import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';

const textTheme = TextTheme(
  titleLarge: TextStyle(
    color: Color.fromARGB(255, 42, 42, 42),
    fontFamily: 'Roboto-Regular',
    fontWeight: FontWeight.w600,
    fontSize: 18,
  ),
  titleMedium: TextStyle(
    color: ColorCollection.text,

    fontFamily: 'Roboto-Medium',
    fontWeight: FontWeight.w600,
    fontSize: 18,
  ),
  titleSmall: TextStyle(
    color: ColorCollection.text,

    fontFamily: 'Roboto-Medium',
    fontWeight: FontWeight.w500,
    fontSize: 14,
  ),
  labelLarge: TextStyle(
    color: ColorCollection.text,

    fontFamily: 'Roboto-Medium',
    fontWeight: FontWeight.w300,
    fontSize: 13,
  ),
  labelMedium: TextStyle(
    color: ColorCollection.text,

    fontFamily: 'Roboto-Medium',
    fontWeight: FontWeight.w500,
    fontSize: 12,
  ),
  labelSmall: TextStyle(
    color: ColorCollection.text,

    fontFamily: 'Roboto-Medium',
    fontWeight: FontWeight.w500,
    fontSize: 11,
  ),
  bodyLarge: TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),

    fontFamily: 'Roboto-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 16,
  ),
  bodyMedium: TextStyle(
    color: ColorCollection.text,

    fontFamily: 'Roboto-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  ),
  bodySmall: TextStyle(
    color: ColorCollection.text,

    fontFamily: 'Roboto-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ),
);