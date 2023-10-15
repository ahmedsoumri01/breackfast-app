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
      iconPath: "assets/icons/keto_diet.png",
      level: "Intermediate",
      duration: "30 Days",
      calorie: "1200 Kcal",
      viewIsSelected: false,
      boxColor: Color.fromARGB(255, 67, 91, 117),
    ));
    diets.add(DietModel(
      name: "Paleo Diet",
      iconPath: "assets/icons/paleo_diet.png",
      level: "Beginner",
      duration: "15 Days",
      calorie: "1000 Kcal",
      viewIsSelected: false,
      boxColor: Color.fromARGB(255, 37, 186, 37),
    ));
    diets.add(DietModel(
      name: "Vegan Diet",
      iconPath: "assets/icons/vegan_diet.png",
      level: "Advanced",
      duration: "60 Days",
      calorie: "1500 Kcal",
      viewIsSelected: false,
      boxColor: Color.fromARGB(255, 207, 19, 113),
    ));
    diets.add(DietModel(
      name: "Vegetarian Diet",
      iconPath: "assets/icons/vegetarian_diet.png",
      level: "Intermediate",
      duration: "45 Days",
      calorie: "1300 Kcal",
      viewIsSelected: false,
      boxColor: Color.fromARGB(255, 233, 233, 14),
    ));
    return diets;
  }
}