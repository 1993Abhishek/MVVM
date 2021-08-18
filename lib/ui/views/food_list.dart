import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/helper/app_view_helper.dart';
import 'package:nvme/ui/views/food_details.dart';

class FoodLisfPage extends StatefulWidget {
  const FoodLisfPage({Key key}) : super(key: key);

  @override
  _FoodLisfPageState createState() => _FoodLisfPageState();
}

class _FoodLisfPageState extends State<FoodLisfPage> {
  List<String> filterNames = ["Filters", "Sorting", "Near Me", "Ratings"];
  List<bool> selectedFilters = List.filled(4, false);
  bool isNearMe = false;
  bool isFoodDetailsNeed = false;

  chooseFilter({String filterText}) {
    switch (filterText) {
      case "Near Me":
        setState(() {
          // isNearMe = true;
        });
        break;
    }
  }

  Widget filterCard({
    String filterName,
    Function onTap,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hDimen(50),
        width: hDimen(100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            hDimen(20),
          ),
        ),
        child: Card(
          color: isSelected ? Colors.orangeAccent : Colors.white,
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
                color: isSelected ? Colors.white : Colors.black,
                fontSize: hDimen(15),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ovalButton({
    String buttonText,
    Color containerColor,
    Color textColor,
  }) {
    return Container(
      height: hDimen(25),
      width: hDimen(60),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(hDimen(20)),
        border: Border.all(
          color: textColor,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: hDimen(12),
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget toadySpecialCard({
    String imgPath,
    String foodName,
    String time,
    String price,
    Function onTab,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: hDimen(200),
        width: hDimen(110),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: hDimen(100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(hDimen(10)),
                child: Image.asset(
                  "assets/home_poster.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            vSpacing(hDimen(8)),
            Text(
              foodName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: hDimen(14),
              ),
            ),
            vSpacing(hDimen(8)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ovalButton(
                  textColor: Colors.green,
                  buttonText: "South",
                  containerColor: Colors.green[50],
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: hDimen(16),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            vSpacing(hDimen(8)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.av_timer_outlined,
                  color: Colors.black54,
                  size: hDimen(20),
                ),
                hSpacing(hDimen(5)),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: hDimen(16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget menuContainer() {
    return Container(
      width: hDimen(100),
      height: hDimen(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrange,
            Colors.orangeAccent,
          ],
          end: Alignment.centerRight,
          begin: Alignment.centerLeft,
        ),
        border: Border.all(
          color: Colors.grey[400],
          width: 0.0,
        ),
        borderRadius: BorderRadius.circular(hDimen(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Maki.restaurant,
            color: Colors.white,
            size: hDimen(25),
          ),
          hSpacing(hDimen(5)),
          Text(
            "Menu",
            style: TextStyle(
              color: Colors.white,
              fontSize: hDimen(15),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isFoodDetailsNeed
        ? FoodDetailsScreen()
        : Container(
            color: Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: hDimen(15),
                    right: hDimen(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      vSpacing(hDimen(10)),
                      Container(
                        height: hDimen(50),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: hDimen(10)),
                              child: filterCard(
                                filterName: filterNames[index],
                                isSelected: selectedFilters[index],
                                onTap: () {
                                  setState(() {
                                    for (var i = 0;
                                        i < selectedFilters.length;
                                        i++) {
                                      selectedFilters[i] = false;
                                    }
                                    selectedFilters[index] = true;
                                  });
                                  chooseFilter(filterText: filterNames[index]);
                                },
                              ),
                            );
                          },
                          physics: BouncingScrollPhysics(),
                          itemCount: filterNames.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      vSpacing(hDimen(15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "FRIENDS RESTAURANT",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: hDimen(18),
                            ),
                          ),
                          Text(
                            "526 DISHES",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: hDimen(14),
                            ),
                          ),
                        ],
                      ),
                      vSpacing(hDimen(5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star_half_rounded,
                                color: Colors.yellow[900],
                                size: hDimen(20),
                              ),
                              hSpacing(hDimen(10)),
                              Text(
                                "4.4 (15k)",
                                style: TextStyle(
                                  color: Colors.yellow[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: hDimen(15),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.black54,
                                size: hDimen(20),
                              ),
                              hSpacing(hDimen(5)),
                              Text(
                                "Waldeck Street, US",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: hDimen(15),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      vSpacing(hDimen(20)),
                      Text(
                        "Chicken Gravies",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: hDimen(18),
                        ),
                      ),
                      vSpacing(hDimen(10)),
                      Container(
                        height: hDimen(190),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: hDimen(15)),
                              child: toadySpecialCard(
                                price: "\$25",
                                foodName: "Fish Fry Rice",
                                time: "35 mints",
                                imgPath: "assets/home_poster.jpg",
                                onTab: () {
                                  setState(() {
                                    isFoodDetailsNeed = !isFoodDetailsNeed;
                                  });
                                },
                              ),
                            );
                          },
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                        ),
                      ),
                      vSpacing(hDimen(20)),
                      Text(
                        "Main Dishes",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: hDimen(18),
                        ),
                      ),
                      vSpacing(hDimen(20)),
                      Container(
                        height: hDimen(190),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: hDimen(15)),
                              child: toadySpecialCard(
                                price: "\$25",
                                foodName: "Fish Fry Rice",
                                time: "35 mints",
                                imgPath: "assets/home_poster.jpg",
                                onTab: () {
                                  setState(() {
                                    isFoodDetailsNeed = !isFoodDetailsNeed;
                                  });
                                },
                              ),
                            );
                          },
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:hDimen(10)),
                  child: Align(
                    child: menuContainer(),
                    alignment: Alignment.bottomRight,
                  ),
                ),
              ],
            ),
          );
  }
}
