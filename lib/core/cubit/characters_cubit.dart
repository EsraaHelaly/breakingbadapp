import 'package:bloc/bloc.dart';
import 'package:breakingbadapp/core/cubit/characters_state.dart';
import 'package:breakingbadapp/core/services/dio_helper.dart';
import 'package:breakingbadapp/model/character_model.dart';
import 'package:breakingbadapp/model/quotes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());

  static CharactersCubit get(context) => BlocProvider.of(context);

  List<dynamic> characters;
  List<dynamic> quotes;

  List<dynamic> searchCharacters;
  

  bool isSearch = false;
  final TextEditingController searchTextController = TextEditingController();

  void searchCharacter(String char) {
    emit(SearchCharacterLoading());
    searchCharacters = characters
        .where((character) => character.name.toLowerCase().contains(char))
        .toList();

    emit(SearchCharacterSuccess());
  }

  getCharacters() {
    emit(CharactersLoading());

    DioHelper().getData(url: character).then((value) {
      // List chars = value.data;

      characters = value.data.map((e) => CharactersModel.fromJson(e)).toList();

      emit(CharactersSuccess());
    }).catchError((error) {
      emit(CharactersError(error: error));
    });
  }

  getQuotes(String author) {
    emit(CharacterQuotesLoading());

    DioHelper()
        .getData(url: quote, queryParameters: {'author': author}).then((value) {
      quotes = value.data.map((e) => QuotesModel.fromJson(e)).toList();
      // print('quotes len ========${quotes.length.toString()}');

      emit(CharacterQuotesSuccess());
    }).catchError((error) {
      // print('error==${error.toString()}');
      emit(CharacterQuotesError(error: error));
    });
  }
}
