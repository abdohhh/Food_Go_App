import 'package:flutter/material.dart';

class Side_options extends StatelessWidget {
  final int index;
  final void Function() onAdd;
  final List ingredients;

  const Side_options({
    super.key,
    required this.index,
    required this.onAdd,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10, top: 10, left: 20),
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 2),
          width: 110,
          height: 140,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 91, 71, 71),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "added = ${ingredients[index].added}",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),

        /// side options container
        Container(
          margin: EdgeInsets.only(right: 10, top: 10, left: 20),
          padding: EdgeInsets.all(10),
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: Color(0xff3C2F2F),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                ingredients[index].name,
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  onAdd();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ),

        /// side options image
        Container(
          width: 110,
          height: 70,
          margin: EdgeInsets.only(right: 10, top: 10, left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(ingredients[index].image, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
