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
        iconPath: "assets/plate.svg",
        boxColor: Color.fromARGB(255, 255, 217, 217),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Pizza',
        iconPath: 'assets/icons/pizza.svg',
        boxColor: Color.fromARGB(255, 217, 255, 217),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Sushi',
        iconPath: 'assets/icons/sushi.svg',
        boxColor: Color.fromARGB(255, 217, 217, 255),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/salad.svg',
        boxColor: Color.fromARGB(255, 255, 255, 217),
      ),
    );
    return categories;
  }
}
