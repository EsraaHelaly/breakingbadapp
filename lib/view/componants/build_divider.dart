import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    Key key,
    this.endIndent,
  }) : super(key: key);

  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      color: Colors.purple[100],
      //the rest of the space
      endIndent: endIndent,
      thickness: 2,
    );
  }
}
