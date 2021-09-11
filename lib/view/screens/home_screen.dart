import 'package:breakingbadapp/core/cubit/characters_cubit.dart';
import 'package:breakingbadapp/core/cubit/characters_state.dart';
import 'package:breakingbadapp/view/componants/build_no_internet_widget.dart';
import 'package:breakingbadapp/view/widgets/build_appbar_actions.dart';
import 'package:breakingbadapp/view/widgets/build_char_gridview.dart';

import 'package:breakingbadapp/view/widgets/build_search_text_filed.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

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
            backgroundColor:
                state is CharactersLoading ? Colors.white : Colors.grey,
            appBar: AppBar(
                backgroundColor: Colors.purple[200],
                title: cubit.isSearch
                    ? BuildSearchTextField(cubit: cubit)
                    : const Text('Characters',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                actions: [
                  BuildAppBarActions(cubit: cubit),
                ]),
            body: OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                ) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;

                  if (connected) {
                    return state is! CharactersLoading
                        ? BuildCharactersGridView(cubit: cubit)
                        : Center(child: Image.asset('images/loading.gif'));
                  } else {
                    return const BuildNoInternetWidget();
                  }
                },
                child: const Center(child: CircularProgressIndicator())),
          );
        },
      ),
    );
  }
}
