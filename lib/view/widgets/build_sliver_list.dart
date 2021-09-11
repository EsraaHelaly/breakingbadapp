import 'package:breakingbadapp/view/componants/build_animated_text_qoutes.dart';
import 'package:breakingbadapp/view/componants/build_divider.dart';
import 'package:breakingbadapp/view/componants/build_richtext.dart';
import 'package:flutter/material.dart';

class BuildSliverListItem extends StatelessWidget {
  const BuildSliverListItem({
    Key key,
    @required this.cubit,
  }) : super(key: key);

  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildRichText(title: 'Job:', text: cubit.jobs.join(' / ')),
                const BuildDivider(endIndent: 315),
                BuildRichText(title: 'Appeared in:', text: cubit.category),
                const BuildDivider(endIndent: 250),
                BuildRichText(
                    title: 'Seasons:', text: cubit.appearance.join(' / ')),
                const BuildDivider(endIndent: 280),
                BuildRichText(title: 'Status:', text: cubit.status),
                const BuildDivider(endIndent: 300),
                BuildRichText(title: 'Actor/Actors:', text: cubit.name),
                const BuildDivider(endIndent: 230),
                const SizedBox(height: 20),
                const BuildAnimatedTextQuotes(),
              ],
            ),
          ),
          const SizedBox(height: 500),
        ],
      ),
    );
  }
}
