import 'package:flutter/material.dart';

class BuildRichText extends StatelessWidget {
  const BuildRichText({
    Key key,
    this.title,
    this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      //etc...
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            children: [
              TextSpan(
                text: text,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
