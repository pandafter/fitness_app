import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;
  bool boxIsSelected;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.boxIsSelected,
  });

  // Convert JSON to CategoryModel
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? '',
      iconPath: json['iconPath'] ?? '',
      boxColor: Color(int.parse(json['boxColor'].replaceAll('#', '0xff'))),
      boxIsSelected: json['boxIsSelected'] ?? false,
    );
  }

  // Convert CategoryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iconPath': iconPath,
      'boxColor':
          boxColor.value.toRadixString(16).padLeft(8, '0').toUpperCase(),
      'boxIsSelected': boxIsSelected,
    };
  }
}
