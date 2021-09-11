import 'package:breakingbadapp/core/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';

class BuildAppBarActions extends StatelessWidget {
  const BuildAppBarActions({
    Key key,
    @required this.cubit,
  }) : super(key: key);

  final CharactersCubit cubit;

  @override
  Widget build(BuildContext context) {
    if (cubit.isSearch) {
      return IconButton(
        onPressed: () {
          cubit.searchTextController.clear();
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.clear),
      );
    } else {
      return IconButton(
        onPressed: () {
          ModalRoute.of(context)
              .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
            cubit.searchTextController.clear();
            cubit.isSearch = false;
          }));

          cubit.isSearch = true;
        },
        icon: const Icon(Icons.search),
      );
    }
  }
}
