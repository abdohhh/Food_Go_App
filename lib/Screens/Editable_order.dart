import 'package:flutter/material.dart';
import 'package:food_app/Wights/Appbar_app.dart';
import 'package:food_app/Wights/Portion_Level.dart';
import 'package:food_app/Wights/Side%20options.dart';
import 'package:food_app/Wights/Spicy_level.dart';
import 'package:food_app/methods/double_extintion.dart';
import 'package:food_app/models/Toppings.dart';
import 'package:food_app/routes/routes.dart';

class EditableOrder extends StatefulWidget {
  const EditableOrder({super.key});

  @override
  State<EditableOrder> createState() => _EditableOrderState();
}

class _EditableOrderState extends State<EditableOrder> {
  late double spicy =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["spicy"];

  late int Portion =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["Portion"];
  late double price =
      (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)["price"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appbar_app(
                onSearchPressed: () {
                  Navigator.pop(context);
                },
              ),
              Row(
                children: [
                  /// image and description
                  Expanded(
                    child: Image.asset(
                      "assets/723a0158e1c46a9ba88ccbb576736c5f6554d691.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  20.0.gap,

                  /// description and customizations
                  Expanded(
                    child: Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Customize",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff3C2F2F),
                                ),
                              ),
                              TextSpan(
                                text:
                                    " Your Burger to Your Tastes. Ultimate Experience",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff3C2F2F),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),

                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        34.0.gap,
                        SpicyLevelState(
                          spicy: spicy,
                          oncliked: (double p1) {
                            setState(() {
                              spicy = p1;
                            });
                          },
                        ),
                        54.0.gap,
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
                  ),
                ],
              ),
              25.0.gap,

              /// toppings title
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Toppings",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3C2F2F),
                  ),
                ),
              ),

              /// toppings list
              SizedBox(
                height: 140,
                child: ListView.builder(
                  itemCount: toppings.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Side_options(
                      index: index,
                      onAdd: () {
                        setState(() {
                          toppings[index].added++;
                          price += toppings[index].price;
                        });
                      },
                      ingredients: toppings,
                    );
                  },
                ),
              ),
              // side options title
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "Side options",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3C2F2F),
                  ),
                ),
              ),
              // side options list
              SizedBox(
                height: 140,
                child: ListView.builder(
                  itemCount: SideOptions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Side_options(
                      index: index,
                      onAdd: () {
                        setState(() {
                          SideOptions[index].added++;
                          price += SideOptions[index].price;
                        });
                      },
                      ingredients: SideOptions,
                    );
                  },
                ),
              ),
              30.0.gap,
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff3C2F2F),
                          ),
                        ),
                        10.0.gap,
                        Text(
                          "\$${price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3C2F2F),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Simulate placing an order
                        Navigator.pushNamed(context, AppRoutes.Payment,arguments: price);
                      },
                      child: Container(
                        width: 200,
                        height: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffEF2A39),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Order Now",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
