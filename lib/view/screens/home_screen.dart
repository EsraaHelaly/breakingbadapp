import 'package:breakingbadapp/core/cubit/characters_cubit.dart';
import 'package:breakingbadapp/core/cubit/characters_state.dart';

import 'package:breakingbadapp/view/widgets/build_character_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit()..getCharacters(),
      child: BlocConsumer<CharactersCubit, CharactersState>(
        listener: (context, state) {},
        builder: (context, state) {
          CharactersCubit cubit = CharactersCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: const Text('characters'),
              ),
              body: state is! CharactersLoading
                  ? SingleChildScrollView(
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
                            cubit.characters.length,
                            (index) => BuildCharacterItem(
                                cubit: cubit.characters[index]),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Image.asset(
                      'images/loading.gif',
                    )));
        },
      ),
    );
  }
}
