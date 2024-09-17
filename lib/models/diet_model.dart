import 'package:flutter/material.dart';


class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;


  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List<DietModel> getDiet() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        name: 'Honey', 
        iconPath: 'assets/icons/honey-pancakes.svg', 
        level: 'Easy', 
        duration: '30 mins', 
        calorie: '180 kCal',
        boxColor: const Color.fromARGB(255, 253, 180, 146),
        viewIsSelected: true
        )
    );

    diets.add(
      DietModel(
        name: 'Canai Bread', 
        iconPath: 'assets/icons/canai-bread.svg', 
        level: 'Easy', 
        duration: '20 mins', 
        calorie: '230 kCal',
        boxColor: const Color.fromARGB(255, 251, 146, 253),
        viewIsSelected: false
        )
    );


    return diets;
  }

}