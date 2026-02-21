import 'package:flutter/material.dart';



class PortionLevelState extends StatelessWidget {
  final int Portion;
  final ValueChanged<int> onChanged;

  const PortionLevelState({super.key, required this.Portion, required this.onChanged});





  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 80,
      child: Column(
        children: [
          Row(children: [Text("Portion")]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  onChanged(Portion -1);
                },
                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffEF2A39),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Icon(Icons.remove, color: Colors.white),
                ),
              ),
              Text(
                Portion.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              IconButton(
                onPressed: () {
                  onChanged(Portion + 1);
                },

                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffEF2A39),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
