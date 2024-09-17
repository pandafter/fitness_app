import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool boxIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.boxIsSelected,
  });

  // Convert JSON to DietModel
  factory DietModel.fromJson(Map<String, dynamic> json) {
    return DietModel(
      name: json['name'] ?? '',
      iconPath: json['iconPath'] ?? '',
      level: json['level'] ?? '',
      duration: json['duration'] ?? '',
      calorie: json['calorie'] ?? '',
      boxColor: Color(int.parse(json['boxColor'].replaceAll('#', '0xff'))),
      boxIsSelected: json['boxIsSelected'] ?? false,
    );
  }

  // Convert DietModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iconPath': iconPath,
      'level': level,
      'duration': duration,
      'calorie': calorie,
      'boxColor':
          boxColor.value.toRadixString(16).padLeft(8, '0').toUpperCase(),
      'boxIsSelected': boxIsSelected,
    };
  }
}
