

import 'package:flutter/material.dart';

@immutable
sealed class FilterState {
}

class UpdateState extends FilterState {
  final List<String> currentCategoriesList;
  final Map<String, bool> currentCategoriesMap;

   UpdateState({
    required this.currentCategoriesMap,
    required this.currentCategoriesList,
  });
}

class LoadingState extends FilterState {

}