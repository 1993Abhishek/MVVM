import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/helper/app_view_helper.dart';
import 'package:nvme/ui/views/food_details.dart';
import 'package:nvme/ui/views/food_list.dart';
import 'package:nvme/ui/views/restaurant_list.dart';
import 'package:nvme/ui/widgets/customDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFoodDetailsNeed=false;
  bool isRestaurantListNeeded=false;

  Widget customContainer({
    Color color,
    IconData icon,
    String price,
    Color textColor,
  }) {
    return Container(
      height: hDimen(65),
      width: hDimen(40),
      decoration: BoxDecoration(
        border: Border.all(
          color: textColor,
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(hDimen(20)),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textColor,
            size: hDimen(18),
          ),
          vSpacing(hDimen(5)),
          Text(
            price,
            style: TextStyle(
              color: textColor,
              fontSize: hDimen(15),
            ),
          )
        ],
      ),
    );
  }

  Widget categoryCard({
    Color color,
    IconData icon,
    String price,
    Color textColor,
    String foodCategory,
  }) {
    return Container(
      height: hDimen(100),
      width: hDimen(150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customContainer(
            color: color,
            icon: icon,
            price: price,
            textColor: textColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: hDimen(10)),
                width: hDimen(110),
                height: hDimen(35),
                child: Card(
                  margin: EdgeInsets.only(
                    left: 0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(
                        hDimen(20),
                      ),
                      topRight: Radius.circular(
                        hDimen(20),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Home Made",
                      style: TextStyle(
                        fontSize: hDimen(14),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              vSpacing(hDimen(5)),
              Container(
                width: hDimen(110),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "Explore Items",
                      style: TextStyle(
                        fontSize: hDimen(11),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: hDimen(18),
                      color: Colors.black,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
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
                roundedButton(
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

  Widget roundedButton({
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

  @override
  Widget build(BuildContext context) {
    return isFoodDetailsNeed? RestaurantListView():Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: hDimen(10),
          right: hDimen(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            vSpacing(hDimen(10)),
            Container(
              height: hDimen(150),
              width: double.infinity,
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
            ),
            vSpacing(hDimen(20)),
            Text(
              "Category",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: hDimen(20),
              ),
            ),
            Container(
              height: hDimen(100),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: hDimen(10)),
                    child: categoryCard(
                      color: Colors.red[50],
                      textColor: Colors.red,
                      price: "112",
                      icon: Icons.home,
                      foodCategory: "Home Made",
                    ),
                  );
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              ),
            ),
            vSpacing(hDimen(5)),
            Text(
              "Today Special",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: hDimen(20),
              ),
            ),
            vSpacing(hDimen(15)),
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
                      onTab: (){
                        setState(() {
                          isFoodDetailsNeed=!isFoodDetailsNeed;
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
            vSpacing(hDimen(5)),
            Text(
              "Available Restaurant",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: hDimen(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
