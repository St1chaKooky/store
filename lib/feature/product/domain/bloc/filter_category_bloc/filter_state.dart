

import 'package:flutter/material.dart';

@immutable
sealed class FilterState {
}

class UpdateFilterState extends FilterState {
  final List<String> currentCategoriesList;
  final Map<String, bool> currentCategoriesMap;

   UpdateFilterState({
    required this.currentCategoriesMap,
    required this.currentCategoriesList,
  });
}

class LoadingFilterState extends FilterState {

}