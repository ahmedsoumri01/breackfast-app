import 'package:flutter/material.dart';
import 'package:Breackfast_App/models/category_model.dart';
import 'package:Breackfast_App/models/diet_model.dart';
import 'package:Breackfast_App/models/popular_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  /*  void _getDiets() {
    diets = DietModel.getDiets();
  } */

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  /*  @override
  void initState() {
    super.initState();
    _getCategories();
  } */

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: /* Image.asset("assets/images/pizza.png") */

          ListView(
        children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          _categoriesSection(),
          const SizedBox(
            height: 40,
          ),
          _dietSection(),
          const SizedBox(
            height: 40,
          ),
          _popularSection(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Column _popularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Popular Diets',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 115,
              decoration: BoxDecoration(
                  color: popularDiets[index].boxIsSelected
                      ? const Color.fromARGB(255, 250, 251, 252)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: popularDiets[index].boxIsSelected
                      ? [
                          BoxShadow(
                            color: const Color.fromARGB(255, 37, 36, 36)
                                .withOpacity(0.11),
                            offset: const Offset(0, 4),
                            blurRadius: 40,
                            spreadRadius: 0.0,
                          ),
                        ]
                      : []),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(popularDiets[index].iconPath,
                      height: 60, width: 60),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDiets[index].name,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${popularDiets[index].level} / ${popularDiets[index].duration} / ${popularDiets[index].calorie}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 78, 91, 239),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "Arrow.svg",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 25,
          ),
          itemCount: popularDiets.length,
          shrinkWrap: true,
        )
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
            'Recommandation \n for Diets',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 250,
          padding: const EdgeInsets.only(left: 20, right: 20),
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
                        Image.asset(diets[index].iconPath),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          diets[index].name,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${diets[index].level} / ${diets[index].duration} / ${diets[index].calorie}',
                          style: const TextStyle(
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
                                  : const Color(0xffC58BF2),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                diets[index].viewIsSelected
                                    ? const Color(0xff9DCEFF)
                                    : const Color.fromARGB(0, 223, 248, 5),
                                diets[index].viewIsSelected
                                    ? const Color(0xff9DCEFF)
                                    : const Color.fromARGB(0, 230, 0, 0),
                              ]),
                              borderRadius: BorderRadius.circular(16)),
                        )
                      ],
                    ));
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
              itemCount: diets.length,
              scrollDirection: Axis.horizontal),
        )
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
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
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 150,
          /*  color: Colors.red, */
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            categories[index].iconPath,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
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
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 37, 36, 36).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search panckake',
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 112, 112, 112),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.search, // Use the search icon
                color:
                    Color.fromARGB(255, 0, 0, 0), // Change the color as needed
                size: 30, // Change the size as needed
              ),
            ),
            suffixIcon: Container(
              width: 100,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Color.fromARGB(255, 112, 112, 112),
                    thickness: 0.1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.settings, // Use the search icon
                      color: Color.fromARGB(
                          255, 0, 0, 0), // Change the color as needed
                      size: 30, // Change the size as needed
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
      title: const Text(
        "Brealfast App",
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      centerTitle: true,

      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 0, // Add this line to remove the shadow
      leading: GestureDetector(
          onTap: () {},
          child: Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              /* color: const Color.fromARGB(255, 207, 169, 169), */
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_circle_left_outlined, // Use the search icon
              color: Color.fromARGB(255, 0, 0, 0), // Change the color as needed
              size: 30, // Change the size as needed
            ),
          )),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              width: 37,
              decoration: BoxDecoration(
                /* color: const Color.fromARGB(255, 207, 169, 169), */
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.filter_list,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 20,
              ),
            ))
      ],
    );
  }
}
