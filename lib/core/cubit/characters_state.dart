
import 'package:flutter/material.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersSuccess extends CharactersState {}

class CharactersError extends CharactersState {
  final String error;
  CharactersError({this.error});

}

class SearchCharacterLoading extends CharactersState {}

class SearchCharacterSuccess extends CharactersState {}

class SearchCharacterError extends CharactersState {
  final String error;
  SearchCharacterError({this.error});

}



