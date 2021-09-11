import 'package:breakingbadapp/core/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';

class BuildSearchTextField extends StatelessWidget {
  const BuildSearchTextField({
    Key key,
    @required this.cubit,
  }) : super(key: key);

  final CharactersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cubit.searchTextController,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: 'find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black, fontSize: 18),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 18),
      onChanged: (char) {
        cubit.searchCharacter(char);
      },
    );
  }
}