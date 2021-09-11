import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breakingbadapp/core/cubit/characters_cubit.dart';
import 'package:breakingbadapp/core/cubit/characters_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildAnimatedTextQuotes extends StatelessWidget {
  const BuildAnimatedTextQuotes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      // ignore: missing_return
      builder: (context, state) {
        List quotes = CharactersCubit.get(context).quotes;

        if (state is CharacterQuotesSuccess) {
          if (quotes.isNotEmpty) {
            int randomQuoteIndex = Random().nextInt(quotes.length - 1);
            return Center(
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 7,
                      color: Colors.grey,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText(quotes[randomQuoteIndex].quote),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        } else {
          return Center(
              child: CircularProgressIndicator(color: Colors.purple[100]));
        }
      },
    );
  }
}
