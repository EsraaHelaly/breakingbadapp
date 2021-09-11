import 'package:flutter/material.dart';

class BuildNoInternetWidget extends StatelessWidget {
  const BuildNoInternetWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset('images/no_internet.png'),
            const Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}