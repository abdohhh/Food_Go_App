import 'package:flutter/material.dart';

class AllBurgersWitget extends StatelessWidget {
  const AllBurgersWitget({
    super.key,
    required this.imagename,
    required this.name,
    required this.shop,
    required this.rating,
  });

  final String imagename;
  final double rating;
  final String name;
  final String shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(right: 10, left: 10, top: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            child: Image.asset(
              imagename,
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name.split(' ').first,

                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w900,
                      color: Color(0xff3C2F2F),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    shop,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xff3C2F2F),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(rating.toString()),
                      Spacer(),
                      Image.asset("assets/Vector.png"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
