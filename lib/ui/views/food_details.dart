import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nvme/router.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/helper/app_view_helper.dart';
import 'package:nvme/ui/widgets/filter_widget.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({Key key}) : super(key: key);

  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  List<String> filterNames = ["Filters", "Sorting", "Near Me", "Ratings"];
  // bool isFoodDetailsNeed = false;
  bool isNearMe = false;
  int initialPrice = 25;
  List<bool> selectedFilters = List.filled(4, false);

  chooseFilter({String filterText}) {
    switch (filterText) {
      case "Near Me":
        setState(() {
          isNearMe = true;
        });
        break;
    }
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
                color:isSelected ? Colors.white:Colors.black,
                fontSize: hDimen(15),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  int counterItem = 0;

  Widget roundedButtonAdd({Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hDimen(25),
        width: hDimen(25),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: hDimen(20),
          ),
        ),
      ),
    );
  }

  Widget roundedButtonSub({
    Function onTab,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: hDimen(25),
        width: hDimen(25),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
            child: Text(
          "-",
          style: TextStyle(
            color: Colors.black,
            fontSize: hDimen(23),
          ),
        )),
      ),
    );
  }

  Widget addCartButton() {
    return Container(
      height: hDimen(45),
      width: hDimen(130),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(hDimen(20))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Add",
              style: TextStyle(
                color: Colors.black,
                fontSize: hDimen(14),
              ),
            ),
            roundedButtonAdd(onTap: () {
              initialPrice = 25;
              setState(() {
                counterItem = counterItem + 1;
                initialPrice = initialPrice * counterItem;
              });
            }),
            Text(
              counterItem.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: hDimen(16),
              ),
            ),
            roundedButtonSub(onTab: () {
              initialPrice = 25;
              setState(() {
                if (counterItem > 0) {
                  counterItem = counterItem - 1;
                  initialPrice = initialPrice * counterItem;
                }
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget ingredientContainer({
    String labelTxt,
    String quantity,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.check,
              color: Colors.black,
              size: hDimen(20),
            ),
            hSpacing(hDimen(10)),
            Text(
              labelTxt,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: hDimen(14),
              ),
            ),
          ],
        ),
        Text(
          quantity,
          style: TextStyle(
            color: Colors.black54,
            fontSize: hDimen(14),
          ),
        ),
      ],
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(
            left: hDimen(10),
            right: hDimen(10),
          ),
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.white,
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
                vSpacing(hDimen(20)),
                Text(
                  "Chicken Gravy",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(18),
                  ),
                ),
                vSpacing(hDimen(10)),
                Container(
                  height: hDimen(150),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: hDimen(150),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(hDimen(15)),
                          child: Image.asset("assets/chicken-gravy.jpg"),
                        ),
                      ),
                      hSpacing(hDimen(5)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Chicken Gravy",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: hDimen(16),
                            ),
                          ),
                          vSpacing(hDimen(10)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              roundedButton(
                                textColor: Colors.green,
                                buttonText: "South",
                                containerColor: Colors.green[50],
                              ),
                              hSpacing(hDimen(60)),
                              Text(
                                "\$25",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: hDimen(16),
                                ),
                              ),
                            ],
                          ),
                          vSpacing(hDimen(5)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.av_timer_rounded,
                                size: hDimen(20),
                                color: Colors.black,
                              ),
                              hSpacing(hDimen(5)),
                              Text(
                                "35 Mints",
                                style: TextStyle(
                                  fontSize: hDimen(15),
                                  color: Colors.black54,
                                ),
                              ),
                              hSpacing(hDimen(10)),
                              Icon(
                                Icons.star_half_rounded,
                                size: hDimen(18),
                                color: Colors.yellow[900],
                              ),
                              hSpacing(hDimen(3)),
                              Text(
                                "4.4(18.1K)",
                                style: TextStyle(
                                  fontSize: hDimen(15),
                                  color: Colors.yellow[900],
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
                                size: hDimen(15),
                              ),
                              hSpacing(hDimen(10)),
                              Text(
                                "4773 Waldec Street,US",
                                style: TextStyle(
                                  fontSize: hDimen(14),
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          addCartButton(),
                        ],
                      )
                    ],
                  ),
                ),
                vSpacing(hDimen(10)),
                Text(
                  "Ingredients",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(16),
                  ),
                ),
                vSpacing(hDimen(15)),
                ingredientContainer(
                  labelTxt: "Chicken",
                  quantity: "Half kg(Bone Less)",
                ),
                vSpacing(hDimen(10)),
                ingredientContainer(
                  labelTxt: "White onions",
                  quantity: "300 gm",
                ),
                vSpacing(hDimen(10)),
                ingredientContainer(
                  labelTxt: "Ginger and Garlic",
                  quantity: "20 gm",
                ),
                vSpacing(hDimen(10)),
                ingredientContainer(
                  labelTxt: "White pepper powdered",
                  quantity: "5 gm",
                ),
                vSpacing(hDimen(20)),
                Text(
                  "Add More Dishes",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(16),
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
                              // isFoodDetailsNeed = !isFoodDetailsNeed;
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(MVVMRouter.ROUTE_PAYMENT);
                  },
                  child: Container(
                    height: hDimen(45),
                    // width: hDimen(200),
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(
                        hDimen(20),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "PROCEED TO PAY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: hDimen(15),
                          ),
                        ),
                        Text(
                          "\$$initialPrice",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: hDimen(15),
                          ),
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.white,
                          size: hDimen(20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        isNearMe
            ? Align(
                child: Container(
                  child: FilterWidget(),
                  color: Colors.black,
                ),
                alignment: Alignment.bottomCenter,
              )
            : Container(),
      ],
    );
  }
}
