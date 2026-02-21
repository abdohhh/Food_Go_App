import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Wights/mainscreenwitget.dart';
import 'package:food_app/models/allBurgersData.dart';
import 'package:food_app/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categories = ["All", "Combos", "Sliders", "Classic", "Beverages"];
  int selectedCategory = 0;
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header
            Container(
              margin: EdgeInsets.only(top: 28, left: 19, right: 19),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/Foodgo.png",
                        color: Color(0xFF3C2F2F),
                        width: 128,
                        // height: 61,
                      ),
                      Text(
                        "Order your favourite food!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Color(0xff6A6A6A),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset("assets/Mask group.png"),
                  ),
                ],
              ),
            ),
            // Search and filter
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.only(top: 47),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white60,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, .15),
                            blurRadius: 19,
                            spreadRadius: 0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 24),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto",
                                  color: Color(0xff6A6A6A),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 13),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xffEF2A39),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/settings-sliders.png"),
                    ),
                  ),
                ],
              ),
            ),
            // Categories
            Container(
              margin: EdgeInsets.only(top: 40),
              height: 50,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 14),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedCategory == index
                          ? Color(0xffEF2A39)
                          : Color(0xffF3F4F6),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                        color: selectedCategory == index
                            ? Colors.white
                            : Color(0xff6A6A6A),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Burger grid
            Expanded(
              child: GridView.builder(
                itemCount: AllBurgersData.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.products,
                        arguments: {
                          'imagename': AllBurgersData[index].image,
                          'name': AllBurgersData[index].name,
                          'rating': AllBurgersData[index].rating,
                          'time': AllBurgersData[index].time,
                          'description': AllBurgersData[index].description,
                          'Portion': AllBurgersData[index].portion,
                          'spicy': AllBurgersData[index].spicy,
                          'price': AllBurgersData[index].price,
                        },
                      );
                    },
                    child: AllBurgersWitget(
                      imagename: AllBurgersData[index].image,
                      name: AllBurgersData[index].name,
                      shop: AllBurgersData[index].shop,
                      rating: AllBurgersData[index].rating,
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .82,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Color(0xffEF2A39),
          child: Icon(Icons.add, color: Colors.white, size: 28),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            Icons.home,
            Icons.shopping_bag_outlined,
            Icons.favorite_border,
            Icons.person_outline,
          ],
          activeIndex: activeIndex,
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          backgroundColor: Color(0xffEF2A39),
        ),
      ),
    );
  }
}
