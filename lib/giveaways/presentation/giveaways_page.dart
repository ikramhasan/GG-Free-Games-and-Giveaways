import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app/utils/show_error.dart';

import '../../app/presentation/about_page.dart';
import '../data/cubit/giveaways_cubit.dart';
import 'components/giveaway_card.dart';
import 'components/giveaways_filter_modal.dart';

class GiveawaysPage extends StatelessWidget {
  const GiveawaysPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giveaways'),
        actions: [
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.filter,
              size: 18,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                barrierColor: Colors.black.withOpacity(0.8),
                builder: (_) => GiveawaysFilterModal(),
              );
            },
          ),
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.infoCircle,
              size: 22,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(0.8),
                builder: (context) => AlertDialog(
                  backgroundColor: Theme.of(context).cardColor,
                  content: AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<GiveawaysCubit, GiveawaysState>(
          builder: (context, state) {
            if (state is GiveawaysLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GiveawaysLoaded) {
              return ListView.builder(
                key: const PageStorageKey('giveaways-list'),
                itemCount: state.giveawaysList.length,
                itemBuilder: (context, index) {
                  final giveaway = state.giveawaysList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: GiveawayCard(giveaway: giveaway),
                  );
                },
              );
            }

            return Container();
          },
          listener: (context, state) {
            if (state is GiveawaysError) {
              showError(context, state.message);
            }
          },
        ),
      ),
    );
  }
}
