import 'package:flutter/material.dart';

class Appbar_app extends StatelessWidget {
  const Appbar_app({super.key, this.onSearchPressed});
  final void Function()? onSearchPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            onSearchPressed?.call();
          },
          icon: Icon(Icons.arrow_back),
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }
}
