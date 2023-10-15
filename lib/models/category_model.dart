import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Burger',
        iconPath: 'assets/images/berger.png',
        boxColor: const Color.fromARGB(255, 255, 217, 217),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Pizza',
        iconPath: 'assets/images/pizza.png',
        boxColor: const Color.fromARGB(255, 217, 255, 217),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Sushi',
        iconPath: 'assets/images/sushi.jpg',
        boxColor: const Color.fromARGB(255, 217, 217, 255),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Salad',
        iconPath: 'assets/images/pizza.png',
        boxColor: const Color.fromARGB(255, 255, 255, 217),
      ),
    );
    return categories;
  }
}
