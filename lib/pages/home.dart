import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:fitness_app/models/category_model.dart';
import 'package:fitness_app/models/diet_model.dart';
import 'package:fitness_app/models/popular_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popular = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final popularResponse = await http
          .get(Uri.parse('http://10.0.2.2:5158/api/fitnessdata/popular-diets'));
      final dietsResponse = await http
          .get(Uri.parse('http://10.0.2.2:5158/api/fitnessdata/diets'));
      final categoriesResponse = await http
          .get(Uri.parse('http://10.0.2.2:5158/api/fitnessdata/categories'));

      if (popularResponse.statusCode == 200 &&
          dietsResponse.statusCode == 200 &&
          categoriesResponse.statusCode == 200) {
        setState(() {
          popular = (json.decode(popularResponse.body) as List)
              .map((data) => PopularDietsModel.fromJson(data))
              .toList();
          diets = (json.decode(dietsResponse.body) as List)
              .map((data) => DietModel.fromJson(data))
              .toList();
          categories = (json.decode(categoriesResponse.body) as List)
              .map((data) => CategoryModel.fromJson(data))
              .toList();
        });
      } else {
        _showError('Failed to load data');
      }
    } catch (e) {
      _showError('An error occurred: ${e.toString()}');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40),
          _categorySection(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          _popularSection(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Column _popularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        ListView.separated(
          itemCount: popular.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 25),
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff1D1617).withOpacity(0.3),
                    offset: const Offset(0, 10),
                    blurRadius: 40,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    popular[index].iconPath,
                    width: 65,
                    height: 65,
                    placeholderBuilder: (context) => Container(
                      width: 65,
                      height: 65,
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popular[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${popular[index].level} | ${popular[index].duration} | ${popular[index].calorie}',
                        style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/icons/button.svg',
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendations',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      diets[index].iconPath,
                      placeholderBuilder: (context) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    Text(
                      diets[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                      style: const TextStyle(
                        color: Color(0xff7B6F72),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            diets[index].boxIsSelected
                                ? const Color(0xff9DCEFF)
                                : Colors.transparent,
                            diets[index].boxIsSelected
                                ? const Color(0xff92A3FD)
                                : Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: diets[index].boxIsSelected
                                ? Colors.white
                                : const Color(0xffC58bf2),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ],
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xffD9D9D9),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          categories[index].iconPath,
                          width: 30,
                          height: 30,
                          placeholderBuilder: (context) => Container(
                            width: 30,
                            height: 30,
                            color: Colors.grey[200],
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      title: const Text(
        'Fitness App',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
