import 'package:flutter/material.dart';
import 'package:food_app/Wights/Appbar_app.dart';
import 'package:food_app/Wights/Portion_Level.dart';
import 'package:food_app/Wights/Spicy_level.dart';
import 'package:food_app/methods/double_extintion.dart';
import 'package:food_app/routes/routes.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late String imagename =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["imagename"];
  late double rating =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["rating"];
  late String name =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["name"];
  late String time =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["time"];
  late String description =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["description"];

  late int Portion =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["Portion"];
  late double spicy =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["spicy"];

  late double price =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["price"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 25, left: 10, right: 10),
          child: Column(
            children: [
              // AppBar
              Appbar_app(
                onSearchPressed: () {
                  Navigator.pop(context);
                },
              ),
              // Product image and details
              Flexible(child: Image.asset(imagename)),
              // Product details
              Column(
                children: [
                  // Product name and rating
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Color(0xff3C2F2F),
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Shop name
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 5),
                      Text(
                        rating.toString(),
                        style: TextStyle(color: Color(0xff808080)),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "- $time",
                        style: TextStyle(color: Color(0xff808080)),
                      ),
                    ],
                  ),
                  20.0.gap,
                  // Description
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          description,
                          style: TextStyle(
                            color: Color(0xff808080),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.0.gap,
                  // Spicy level and portion controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpicyLevelState(
                        spicy: spicy,
                        oncliked: (double p1) {
                          setState(() {
                            spicy = p1;
                          });
                        },
                      ),
                      PortionLevelState(
                        Portion: Portion,
                        onChanged: (value) {
                          setState(() {
                            Portion = value;
                          });
                        },
                      ),
                    ],
                  ),
                  20.0.gap,
                  // Price and order button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          print(Portion);
                          print(Portion);
                          Navigator.pushNamed(
                            context,
                            AppRoutes.EditableOrder,
                            arguments: {
                              "spicy": spicy,
                              "Portion": Portion,
                              "price": price,
                            },
                          );
                        },
                        child: Container(
                          width: 90,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffEF2A39),
                          ),
                          child: Text(
                            " \$ ${price.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 180,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff3C2F2F),
                          ),
                          child: Text(
                            "ORDER NOW",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
