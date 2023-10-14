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
}

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];

  categories.add(
    CategoryModel(
      name: 'Burger',
      iconPath: 'assets/icons/burger.svg',
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
  return categories;
}
