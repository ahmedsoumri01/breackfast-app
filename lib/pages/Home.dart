import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
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
          Column(
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
                color: Colors.red,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                        /*  margin: EdgeInsets.only(left: 20),
                      width: 100,
                      height: 100,
                      color: Colors.blue, */
                        );
                  },
                ),
              ),
            ],
          )
        ],
      ),
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
