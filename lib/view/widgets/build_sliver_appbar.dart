import 'package:flutter/material.dart';

class BuildSliverAppBar extends StatelessWidget {
  const BuildSliverAppBar({
    Key key,
    @required this.cubit,
  }) : super(key: key);

  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          cubit.nickname,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        background: Hero(
            tag: cubit.charId,
            child: Image.network(cubit.img, fit: BoxFit.cover)),
      ),
    );
  }
}
