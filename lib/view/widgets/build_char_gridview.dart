import 'package:breakingbadapp/core/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';

import 'build_character_item.dart';

class BuildCharactersGridView extends StatelessWidget {
  const BuildCharactersGridView({
    Key key,
    @required this.cubit,
  }) : super(key: key);

  final CharactersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          child: GridView.count(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            children: List.generate(
              cubit.searchTextController.text.isEmpty
                  ? cubit.characters.length
                  : cubit.searchCharacters.length,
              (index) => BuildCharacterItem(
                cubit: cubit.searchTextController.text.isEmpty
                    ? cubit.characters[index]
                    : cubit.searchCharacters[index],
              ),
            ),
          ),
        ),
      );
  }
}
