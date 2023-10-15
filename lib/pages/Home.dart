import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category_model.dart';
import 'package:flutter_application_1/models/diet_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          SizedBox(
            height: 40,
          ),
          _categoriesSection(),
          SizedBox(
            height: 40,
          ),
          _dietSection()
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Recommandation \n for Diets',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 250,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                    width: 210,
                    decoration: BoxDecoration(
                        color: diets[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(diets[index].iconPath),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          diets[index].name,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          diets[index].level +
                              ' / ' +
                              diets[index].duration +
                              ' / ' +
                              diets[index].calorie,
                          style: TextStyle(
                            color: Color.fromARGB(255, 78, 91, 239),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 150,
                          child: Center(
                              child: Text(
                            'View Details',
                            style: TextStyle(
                              color: diets[index].viewIsSelected
                                  ? Colors.white
                                  : Color(0xffC58BF2),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                diets[index].viewIsSelected
                                    ? Color(0xff9DCEFF)
                                    : Color.fromARGB(0, 223, 248, 5),
                                diets[index].viewIsSelected
                                    ? Color(0xff9DCEFF)
                                    : Color.fromARGB(0, 230, 0, 0),
                              ]),
                              borderRadius: BorderRadius.circular(16)),
                        )
                      ],
                    ));
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
              itemCount: diets.length,
              scrollDirection: Axis.horizontal),
          padding: EdgeInsets.only(left: 20, right: 20),
        )
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'categories',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 150,
          /*  color: Colors.red, */
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            categories[index].iconPath,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 37, 36, 36).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search panckake',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 112, 112, 112),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                  height: 20,
                  width: 20,
                )),
            suffixIcon: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Color.fromARGB(255, 112, 112, 112),
                    thickness: 0.1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/icons/Filter.svg",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ));
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Breakfast",
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      centerTitle: true,

      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      elevation: 0, // Add this line to remove the shadow
      leading: GestureDetector(
          onTap: () {},
          child: Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/dots.svg",
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 207, 169, 169),
              borderRadius: BorderRadius.circular(10),
            ),
          )),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              width: 37,
              child: SvgPicture.asset(
                "assets/icons/Filter.svg",
                height: 20,
                width: 40,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 169, 169),
                borderRadius: BorderRadius.circular(10),
              ),
            ))
      ],
    );
  }
}
