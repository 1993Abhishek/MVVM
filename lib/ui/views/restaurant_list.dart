import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/helper/app_view_helper.dart';

class RestaurantListView extends StatefulWidget {
  const RestaurantListView({Key key}) : super(key: key);

  @override
  _RestaurantListViewState createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {
  List<String> filterNames = ["Filters", "Sorting", "Near Me", "Ratings"];
  List<bool> selectedFilters = List.filled(4, false);
  bool isNearMe = false;
  bool isFoodDetailsNeed = false;
  List<String> imagePaths = [
    "assets/restaurant1.jfif",
    "assets/restaurant2.jfif",
    "assets/restaurant3.jfif",
    'assets/restaurant4.jfif',
    'assets/restaurant5.jfif',
  ];
  List<String> restaurantNames=['Oudh 1590','PaPaYa','Indian','Kabuliwala','Peter Cat'];

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
    double widthContainer,
  }) {
    return Container(
      height: hDimen(25),
      width: widthContainer,
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

  Widget restaurantCard({
    String restaurantName,
    String address,
    String availableTime,
    String ratings,
    String imgPath,
  }) {
    return Container(
      height: hDimen(200),
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
            top: hDimen(15),
            left: hDimen(10),
            right: hDimen(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: hDimen(100),
                    width: hDimen(100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        hDimen(20),
                      ),
                      child: Image.asset(
                        imgPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  hSpacing(hDimen(10)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurantName,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: hDimen(18),
                        ),
                      ),
                      vSpacing(hDimen(10)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.star_half_rounded,
                            color: Colors.yellow[900],
                            size: hDimen(20),
                          ),
                          hSpacing(hDimen(5)),
                          Text(
                            ratings,
                            style: TextStyle(
                              color: Colors.yellow[900],
                              fontWeight: FontWeight.bold,
                              fontSize: hDimen(14),
                            ),
                          ),
                          hSpacing(hDimen(40)),
                          Text(
                            availableTime,
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: hDimen(14),
                            ),
                          ),
                        ],
                      ),
                      vSpacing(hDimen(10)),
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
                            address,
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: hDimen(14),
                            ),
                          ),
                        ],
                      ),
                      vSpacing(hDimen(10)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ovalButton(
                            buttonText: "South",
                            containerColor: Colors.green[200],
                            textColor: Colors.green[600],
                            widthContainer: hDimen(60),
                          ),
                          hSpacing(hDimen(20)),
                          ovalButton(
                            buttonText: "Home Made",
                            containerColor: Colors.red[200],
                            textColor: Colors.red[700],
                            widthContainer: hDimen(100),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              vSpacing(hDimen(20)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  smallRow(
                    icon: Icons.bar_chart,
                    labelName: "ORDER NOW",
                  ),
                  Container(
                    height: hDimen(25),
                    width: hDimen(2),
                    color: Colors.grey[350],
                  ),
                  smallRow(
                    icon: Elusive.tags,
                    labelName: "OFFERS",
                  ),
                  Container(
                    height: hDimen(25),
                    width: hDimen(2),
                    color: Colors.grey[350],
                  ),
                  smallRow(
                    icon: Icons.call,
                    labelName: "CALL NOW",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget smallRow({
    IconData icon,
    String labelName,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: hDimen(20),
          color: Colors.black,
        ),
        hSpacing(hDimen(5)),
        Text(
          labelName,
          style: TextStyle(
            color: Colors.black87,
            fontSize: hDimen(14),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
                        for (var i = 0; i < selectedFilters.length; i++) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "165 Restaurants ",
                style: TextStyle(
                  fontSize: hDimen(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Near Your Place",
                style: TextStyle(
                  fontSize: hDimen(16),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: (context, index) => restaurantCard(
                  imgPath: imagePaths[index],
                  address: "Park Street, Kolkata",
                  availableTime: "9AM-10:30Pm",
                  ratings: "4.4 (25k)",
                  restaurantName: restaurantNames[index],
                ),
                physics: BouncingScrollPhysics(),
                itemCount: imagePaths.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
