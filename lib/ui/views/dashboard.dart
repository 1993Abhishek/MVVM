import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/helper/app_view_helper.dart';
import 'package:nvme/ui/views/cart_page.dart';
import 'package:nvme/ui/views/favourite_page.dart';
import 'package:nvme/ui/views/home.dart';
import 'package:nvme/ui/views/profile_page.dart';
import 'package:nvme/ui/views/search_page.dart';
import 'package:nvme/ui/widgets/customDrawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _controller = new PageController();
  ShapeBorder bottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = EdgeInsets.all(12);

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black54;
  Gradient selectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.amber]);

  Color unselectedColor = Colors.blueGrey;
  Gradient unselectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.blueGrey]);
  String dropdownValue = 'England';

  Widget circularImage() {
    return Container(
      height: hDimen(35),
      width: hDimen(35),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 0.0,
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Image.asset(
            "assets/profile.jpg",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget roundedButton() {
    return Container(
      height: hDimen(50),
      width: hDimen(50),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            hDimen(50),
          ),
        ),
        elevation: 2,
        child: Center(
          child: Icon(
            Icons.view_headline,
            size: hDimen(35),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _onPageChanged(
      int page,
      // ThemeData themeData,
      ) {
    switch (page) {
      case 0:
        return SearchPage();
        break;
      case 1:
        return FavouritePage(
          // themeData: isDark ? ThemeData.dark() : themeData,
        );
        break;
      case 2:
        return HomeScreen();
        break;
      case 3:
        return CartView(
          // themeData: isDark ? ThemeData.dark() : themeData,
        );
        break;
      case 4:
        return ProfilePage(
          // themeData: isDark ? ThemeData.dark() : themeData,
        );
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lisa Melanie",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: hDimen(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // vSpacing(hDimen(5)),
                  Container(
                    height: hDimen(30),
                    width: hDimen(120),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: dropdownValue,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black54,
                        size: hDimen(25),
                      ),
                      iconSize: hDimen(25),
                      elevation: 10,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: hDimen(14),
                      ),
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        "America",
                        "Italy",
                        "France",
                        "Germany",
                        "India",
                        "Austrelia",
                        "Arab",
                        "Japan",
                        "England",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              hSpacing(hDimen(70)),
              Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: hDimen(28),
                  ),
                  hSpacing(hDimen(5)),
                  Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                    size: hDimen(28),
                  ),
                  hSpacing(hDimen(5)),
                  Icon(
                    Linecons.cog,
                    color: Colors.black,
                    size: hDimen(25),
                  ),
                  hSpacing(hDimen(5)),
                  circularImage(),
                  hSpacing(hDimen(5))
                ],
              )
            ],
          )
        ],
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              child: roundedButton(),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body:  Container(
        child: PageView.builder(
          controller: _controller,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(seconds: 1),
              child: _onPageChanged(index,),
            );
          },
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          onPageChanged: (value) {
            setState(() {
              _selectedItemPosition = value;
            });
          },
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,
        backgroundColor: Colors.grey[200],
        // elevation: 1,


        snakeViewColor: selectedColor,
        selectedItemColor:
        snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.blueGrey,


        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) {
          print(index);
          setState(() {
            _selectedItemPosition = index;
            _controller.animateToPage(
              index,
              duration: Duration(seconds: 1),
              curve: Curves.ease,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: 'location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconic.user),
            label: 'profile',
          ),
        ],
        selectedLabelStyle: TextStyle(fontSize: hDimen(14)),
        unselectedLabelStyle: TextStyle(fontSize: hDimen(10)),
      ),
    );
  }
}
