import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;
  Color boxColor;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
    required this.boxColor,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];
    diets.add(DietModel(
        name: "Keto Diet",
        iconPath: "assets/images/sushi.jpg",
        level: "Intermediate",
        duration: "30 Days",
        calorie: "1200 Kcal",
        viewIsSelected: false,
        boxColor: Color(0xff9DCEFF)));

    diets.add(DietModel(
        name: "Paleo Diet",
        iconPath: "assets/images/sushi.jpg",
        level: "Beginner",
        duration: "15 Days",
        calorie: "1000 Kcal",
        viewIsSelected: false,
        boxColor: Color(0xffEEA4CE)));
    /*  diets.add(DietModel(
      name: "Vegan Diet",
      iconPath: "assets/images/sushi.jpg",
      level: "Advanced",
      duration: "60 Days",
      calorie: "1500 Kcal",
      viewIsSelected: false,
      boxColor: Color.fromARGB(255, 207, 19, 113),
    )); */
    diets.add(DietModel(
      name: "Vegetarian Diet",
      iconPath: "assets/images/sushi.jpg",
      level: "Intermediate",
      duration: "45 Days",
      calorie: "1300 Kcal",
      viewIsSelected: false,
      boxColor: Color.fromARGB(255, 233, 233, 14),
    ));
    return diets;
  }
}
