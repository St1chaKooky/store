
import 'package:flutter/material.dart';

@immutable
sealed class FilterEvent {}



class GetCategories extends FilterEvent {

}

class EditCategory extends FilterEvent {
  final int index;
  final bool isSelected;
   EditCategory({
    required this.index,required this.isSelected});
}