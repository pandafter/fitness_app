import 'dart:convert';
import 'package:fitness_app/models/popular_model.dart';
import 'package:fitness_app/models/diet_model.dart';
import 'package:fitness_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://10.0.2.2:5158/api/fitnessdata';

  Future<List<PopularDietsModel>> fetchPopularDiets() async {
    final response = await http.get(Uri.parse('$baseUrl/popular-diets'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => PopularDietsModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load popular diets');
    }
  }

  Future<List<DietModel>> fetchDiets() async {
    final response = await http.get(Uri.parse('$baseUrl/diets'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => DietModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load diets');
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => CategoryModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
