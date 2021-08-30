import 'package:breakingbadapp/view/screens/details_screen.dart';
import 'package:flutter/material.dart';

class BuildCharacterItem extends StatelessWidget {
  const BuildCharacterItem({
    Key key,
    @required this.cubit,
  }) : super(key: key);

  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(4),
      margin: const EdgeInsetsDirectional.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(cubit: cubit)));
        },
        child: Hero(
          tag: cubit.charId,
          child: GridTile(
            child: FadeInImage.assetNetwork(
              image: cubit.img,
              placeholder: 'images/loading.gif',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            footer: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              height: 40,
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                cubit.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
