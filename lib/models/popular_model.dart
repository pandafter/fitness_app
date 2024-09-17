class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
  });

  // Convert JSON to PopularDietsModel
  factory PopularDietsModel.fromJson(Map<String, dynamic> json) {
    return PopularDietsModel(
      name: json['name'] ?? '',
      iconPath: json['iconPath'] ?? '',
      level: json['level'] ?? '',
      duration: json['duration'] ?? '',
      calorie: json['calorie'] ?? '',
      boxIsSelected: json['boxIsSelected'] ?? false,
    );
  }

  // Convert PopularDietsModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iconPath': iconPath,
      'level': level,
      'duration': duration,
      'calorie': calorie,
      'boxIsSelected': boxIsSelected,
    };
  }
}
