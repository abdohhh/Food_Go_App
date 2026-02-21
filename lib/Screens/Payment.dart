import 'package:flutter/material.dart';
import 'package:food_app/Wights/Appbar_app.dart';
import 'package:food_app/methods/double_extintion.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late double price = ModalRoute.of(context)!.settings.arguments as double;
  late List<Map<String, dynamic>> OrderDetails = [
    {"name": "Order", "price": price},
    {"name": "Taxes", "price": .3},
    {"name": "Delivery fees", "price": 1.5},
  ];
  List<Map<String, dynamic>> PaymentMethods = [
    {
      "name": "Credit card",
      "icon": "assets/Creditcard.png",
      "number": "5105 **** **** 0505",
      "isSelected": true,
      "color": Color(0xff3C2F2F),
    },
    {
      "name": "Debit card",
      "icon": "assets/Debitcard.png",
      "number": "3566 **** **** 0505",
      "isSelected": false,
      "color": Color.fromARGB(255, 196, 222, 241),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Appbar_app(
                  onSearchPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    "Order summary",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  children: [
                    for (int i = 0; i < OrderDetails.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              OrderDetails[i]["name"],
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff7D7D7D),
                              ),
                            ),
                            Text(
                              "\$${OrderDetails[i]["price"].toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff7D7D7D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total: ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            " \$${(price + 1.8).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Estimated delivery time: ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            " 15 - 30mins",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70, left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Payment methods",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xff3C2F2F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    for (int i = 0; i < 2; i++)
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 5, right: 5),

                        decoration: BoxDecoration(
                          color: PaymentMethods[i]["color"],
                          borderRadius: BorderRadius.circular(19),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.15),
                              blurRadius: 19,
                              offset: Offset(0, 7),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        height: 80,
                        width: 400,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              PaymentMethods[i]["isSelected"] =
                                  !PaymentMethods[i]["isSelected"];
                              PaymentMethods[i == 0 ? 1 : 0]["isSelected"] =
                                  false;
                            });
                          },
                          child: ListTile(
                            leading: Image.asset(PaymentMethods[i]["icon"]),
                            title: Text(
                              PaymentMethods[i]["name"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Roboto",
                              ),
                            ),
                            subtitle: Text(PaymentMethods[i]["number"]),
                            trailing: Icon(
                              PaymentMethods[i]["isSelected"] == true
                                  ? Icons.check_circle_outline_outlined
                                  : Icons.circle_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(top: 80),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 20),
                        child: Column(
                          children: [
                            Text(
                              "Total price",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff808080),
                              ),
                            ),
                            Text(
                              "\$${(price + 1.8).toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.0.gap,
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                icon: Icon(
                                  Icons.check_circle,
                                  color: Color(0xffEF2A39),
                                  size: 90,
                                ),
                                title: Text(
                                  "Success !",
                                  style: TextStyle(
                                    color: Color(0xffEF2A39),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                content: Text(
                                  "Your payment was successful. A receipt for this purchase has been sent to your email.",
                                  style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 14,
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(25),

                                actions: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            color: Color(0xffEF2A39),
                                          ),
                                          width: 200,
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              "Go Back",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      25.0.gap,
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, '/home');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            color: Color(0xffEF2A39),
                                          ),
                                          width: 200,
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              "Go Home",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                actionsAlignment: MainAxisAlignment.center,
                                alignment: Alignment.centerLeft,
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff3C2F2F),
                          ),
                          width: 200,
                          height: 70,
                          child: Center(
                            child: Text(
                              "Pay Now",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
