import 'package:flutter/material.dart';

import '../../../data/models/free_game_details.dart';
import 'about_widget.dart';

class AboutSection extends StatelessWidget {
  final FreeGameDetails game;

  const AboutSection({Key? key, required this.game}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About ${game.title}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          AboutWidget(
            prefix1: 'Game',
            prefix2: 'Genre',
            suffix1: game.title!,
            suffix2: game.genre!,
          ),
          AboutWidget(
            prefix1: 'Platform',
            prefix2: 'Publisher',
            suffix1: game.platform!,
            suffix2: game.publisher!,
          ),
          AboutWidget(
            prefix1: 'Developer',
            prefix2: 'Release Date',
            suffix1: game.developer!,
            suffix2: game.releaseDate == null
                ? 'N/A'
                : game.releaseDate.toString().substring(0, 10),
          ),
        ],
      ),
    );
  }
}
