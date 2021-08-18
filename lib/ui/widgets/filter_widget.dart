import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/helper/app_view_helper.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> imgPaths = [
    "assets/south_indian.jpg",
    "assets/chinese'.jpg",
    "assets/pizza.jpg",
    "assets/tea.jpg",
    "assets/northIndian.jpg",
  ];
  List<String> filterNames = [
    "Near Me",
    "1 to 2 km",
    "2 to 5 km",
    "5 to 10 km",
    "10 to 20 km",
  ];
  List<bool> filterSelecteds = List.filled(5, false);

  bool isNearMe = false;

  bool rating1st = false;
  bool rating2nd = false;
  bool rating3rd = false;
  bool rating4th = false;
  bool rating5th = false;

  List<bool> isSelecteds = List.filled(5, false);
  List<String> foodNames = [
    "South Indian",
    "Chinese",
    "Pizza",
    "Tea and Coffee",
    "North Indian",
  ];

  chooseFilter({String filterText}) {
    switch (filterText) {
      case "Near Me":
        setState(() {
          isNearMe = true;
        });
        break;
    }
  }

  Widget posterContainer({String imgPath}) {
    return Container(
      height: hDimen(50),
      width: hDimen(250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(hDimen(20)),
        border: Border.all(
          color: Colors.grey[400],
          width: 0.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          hDimen(20),
        ),
        child: Image.asset(
          "assets/home_poster.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget filterCard({
    String filterName,
    Function onTap,
    bool isSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hDimen(45),
        width: hDimen(100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            hDimen(20),
          ),
        ),
        child: Card(
          color: isSelected ? Colors.orangeAccent:Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              hDimen(20),
            ),
          ),
          elevation: 2,
          child: Center(
            child: Text(
              filterName,
              style: TextStyle(
                color: isSelected ? Colors.white:Colors.black,
                fontSize: hDimen(15),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget circularContainer({bool isSelected}) {
    return Container(
      height: hDimen(15),
      width: hDimen(15),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Container(
        height: hDimen(8),
        width: hDimen(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget roundedContainer({
    String imgPath,
    String foodName,
    bool isSelected,
    Function onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: hDimen(80),
            width: hDimen(80),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(hDimen(80)),
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          vSpacing(hDimen(5)),
          Text(
            foodName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: hDimen(14),
              color: Colors.black,
            ),
          ),
          vSpacing(hDimen(5)),
          circularContainer(
            isSelected: isSelected,
          ),
        ],
      ),
    );
  }

  Widget ratingContainer({
    String ratingLbl,
    bool isSelected,
    Function onTab,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: hDimen(65),
        height: hDimen(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(hDimen(20)),
          gradient: LinearGradient(
            end: Alignment.centerRight,
            begin: Alignment.centerLeft,
            colors: isSelected
                ? [
                    Colors.deepOrange,
                    Colors.orangeAccent,
                  ]
                : [
                    Colors.white,
                    Colors.white,
                  ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ratingLbl,
              style: TextStyle(
                  fontSize: hDimen(12),
                  color: isSelected ? Colors.white : Colors.black),
            ),
            hSpacing(hDimen(10)),
            Icon(
              Icons.star,
              size: hDimen(20),
              color: isSelected ? Colors.white : Colors.yellow[900],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardRating() {
    return Container(
      height: hDimen(50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(hDimen(20)),
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(hDimen(20)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: hDimen(15),
            right: hDimen(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ratingContainer(
                  isSelected: rating1st,
                  ratingLbl: "1",
                  onTab: () {
                    setState(() {
                      rating1st = true;
                      rating2nd = false;
                      rating3rd = false;
                      rating4th = false;
                      rating5th = false;
                    });
                  }),
              ratingContainer(
                  isSelected: rating2nd,
                  ratingLbl: "2-3",
                  onTab: () {
                    setState(() {
                      rating1st = false;
                      rating2nd = true;
                      rating3rd = false;
                      rating4th = false;
                      rating5th = false;
                    });
                  }),
              ratingContainer(
                  isSelected: rating3rd,
                  ratingLbl: "3-4",
                  onTab: () {
                    setState(() {
                      rating1st = false;
                      rating2nd = false;
                      rating3rd = true;
                      rating4th = false;
                      rating5th = false;
                    });
                  }),
              ratingContainer(
                  isSelected: rating4th,
                  ratingLbl: "4-4.5",
                  onTab: () {
                    setState(() {
                      rating1st = false;
                      rating2nd = false;
                      rating3rd = false;
                      rating4th = true;
                      rating5th = false;
                    });
                  }),
              ratingContainer(
                  isSelected: rating5th,
                  ratingLbl: "5",
                  onTab: () {
                    setState(() {
                      rating1st = false;
                      rating2nd = false;
                      rating3rd = false;
                      rating4th = false;
                      rating5th = true;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hDimen(650),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            hDimen(20),
          ),
          topLeft: Radius.circular(
            hDimen(20),
          ),
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: hDimen(15),
          right: hDimen(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            vSpacing(hDimen(20)),
            Padding(
              padding: EdgeInsets.only(
                // left: hDimen(15),
                right: hDimen(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        LineariconsFree.cross_circle,
                        color: Colors.black,
                        size: hDimen(16),
                      ),
                      hSpacing(hDimen(20)),
                      Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: hDimen(16),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Clear All",
                    style: TextStyle(
                      fontSize: hDimen(16),
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            vSpacing(hDimen(20)),
            Text(
              "CUSINE",
              style: TextStyle(
                fontSize: hDimen(15),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            vSpacing(hDimen(20)),
            Container(
              height: hDimen(130),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: hDimen(15)),
                    child: roundedContainer(
                      imgPath: imgPaths[index],
                      foodName: foodNames[index],
                      isSelected: isSelecteds[index],
                      onTap: () {
                        setState(() {
                          for (var i = 0; i < isSelecteds.length; i++) {
                            isSelecteds[i] = false;
                          }
                          isSelecteds[index] = true;
                        });
                      },
                    ),
                  );
                },
                itemCount: isSelecteds.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              ),
            ),
            vSpacing(hDimen(10)),
            Text(
              "DISTANCE",
              style: TextStyle(
                fontSize: hDimen(15),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            vSpacing(hDimen(10)),
            Container(
              height: hDimen(45),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return filterCard(
                    isSelected: filterSelecteds[index],
                    filterName: filterNames[index],
                    onTap: () {
                      chooseFilter(
                        filterText: filterNames[index],
                      );
                      setState(() {
                        for(var i=0;i<filterSelecteds.length;i++){
                          filterSelecteds[i]=false;
                        }
                        filterSelecteds[index]=true;
                      });
                    },
                  );
                },
                padding: EdgeInsets.all(0),
                physics: BouncingScrollPhysics(),
                itemCount: filterNames.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            vSpacing(hDimen(20)),
            Text(
              "RATING",
              style: TextStyle(
                fontSize: hDimen(15),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            vSpacing(hDimen(10)),
            cardRating(),
            vSpacing(hDimen(20)),
            Text(
              "OFFERS",
              style: TextStyle(
                fontSize: hDimen(15),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            vSpacing(hDimen(10)),
            Container(
              height: hDimen(110),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: hDimen(10)),
                    child: posterContainer(),
                  );
                },
                padding: EdgeInsets.all(0),
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            ),
            vSpacing(hDimen(15)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: hDimen(45),
                  width: hDimen(130),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(hDimen(20)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "CLEAR",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: hDimen(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                hSpacing(hDimen(20)),
                Container(
                  height: hDimen(45),
                  width: hDimen(200),
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(
                      hDimen(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "SHOW RESTAURANTS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: hDimen(15),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
