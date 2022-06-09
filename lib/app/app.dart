import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_games_giveaways/ads/application/cubit/ads_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../free_games/data/cubit/free_game_detail_cubit.dart';
import '../free_games/data/cubit/free_games_cubit.dart';
import '../game_deals/data/cubit/game_deals_cubit.dart';
import '../giveaways/data/cubit/giveaways_cubit.dart';
import 'utils/analytics.dart';
import 'wrapper.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FreeGamesCubit>(
          create: (context) => FreeGamesCubit(),
        ),
        BlocProvider<FreeGameDetailsCubit>(
          create: (context) => FreeGameDetailsCubit(),
        ),
        BlocProvider<GiveawaysCubit>(
          create: (context) => GiveawaysCubit(),
        ),
        BlocProvider<GameDealsCubit>(
          create: (context) => GameDealsCubit(),
        ),
        BlocProvider<AdsCubit>(
          create: (context) => AdsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'GG',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          canvasColor: const Color(0xFF171717),
          cardColor: const Color(0xFF22252B),
          fontFamily: GoogleFonts.merriweather().fontFamily,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF22252B),
              side: const BorderSide(
                color: Color(0xFF52EE01),
              ),
            ),
          ),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF22252B),
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.yellow).copyWith(
            secondary: const Color(0xFF52EE01),
            brightness: Brightness.dark,
          ),
        ),
        navigatorObservers: <NavigatorObserver>[observer],
        home: const Wrapper(),
      ),
    );
  }
}
