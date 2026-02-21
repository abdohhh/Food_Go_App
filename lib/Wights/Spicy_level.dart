import 'package:flutter/material.dart';

class SpicyLevelState extends StatelessWidget {
  final double spicy;

  final Function(double) oncliked;

  const SpicyLevelState({
    super.key,
    required this.spicy,
    required this.oncliked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "spicy",
            style: TextStyle(
              color: Color(0xff3C2F2F),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Slider(
            label: "spicy",
            value: spicy,
            onChanged: (value) {
              oncliked(value);
            },
            min: 0,
            max: 1,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            activeColor: Color(0xffEF2A39),
            thumbColor: Color(0xffEF2A39),
          ),

          Row(
            children: [
              Text(
                "Mild",
                style: TextStyle(
                  color: Color(0xff1CC019),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                "Hot",
                style: TextStyle(
                  color: Color(0xffEF2A39),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
