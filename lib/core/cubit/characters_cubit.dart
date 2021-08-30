import 'package:bloc/bloc.dart';
import 'package:breakingbadapp/core/cubit/characters_state.dart';
import 'package:breakingbadapp/core/services/dio_helper.dart';
import 'package:breakingbadapp/model/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());

  static CharactersCubit get(context) => BlocProvider.of(context);

  List<dynamic> characters;
  List<dynamic> _searchCharacters;
  List<dynamic> getSearchCharacters() => _searchCharacters;

  getCharacters() {
    emit(CharactersLoading());

    DioHelper().getData(url: character).then((value) {
      List chars = value.data;

      characters = .map((e) => CharactersModel.fromJson(e)).toList();
      // print('result==${characters}');

      emit(CharactersSuccess());
    }).catchError((error) {
      // print('error==${error.toString()}')
      emit(CharactersError(error: error));
    });
  }
}
