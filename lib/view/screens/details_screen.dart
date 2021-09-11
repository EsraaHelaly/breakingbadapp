import 'package:breakingbadapp/core/cubit/characters_cubit.dart';
import 'package:breakingbadapp/view/widgets/build_sliver_appbar.dart';
import 'package:breakingbadapp/view/widgets/build_sliver_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key, this.cubit}) : super(key: key);
  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit()..getQuotes(cubit.name),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: CustomScrollView(
          slivers: [
            BuildSliverAppBar(cubit: cubit),
            BuildSliverListItem(
              cubit: cubit,
            ),
          ],
        ),
      ),
    );
  }
}
