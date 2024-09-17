import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad', 
        iconPath: 'assets/icons/plate.svg', 
        boxColor: const Color(0xff92A3FD))
    );

    categories.add(
      CategoryModel(
        name: 'Cake', 
        iconPath: 'assets/icons/pancakes.svg', 
        boxColor: const Color.fromARGB(255, 214, 146, 253))
    );

    categories.add(
      CategoryModel(
        name: 'Pie', 
        iconPath: 'assets/icons/pie.svg', 
        boxColor: const Color.fromARGB(255, 251, 253, 146))
    );

    categories.add(
      CategoryModel(
        name: 'Smoothies', 
        iconPath: 'assets/icons/orange-snacks.svg', 
        boxColor: const Color.fromARGB(255, 148, 253, 146))
    );

    return categories;
  }
}