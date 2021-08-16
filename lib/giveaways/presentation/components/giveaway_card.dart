import 'package:flutter/material.dart';

import '../../data/models/giveaway.dart';
import '../giveaway_details_page.dart';

class GiveawayCard extends StatelessWidget {
  const GiveawayCard({Key? key, required this.giveaway}) : super(key: key);

  final Giveaway giveaway;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GiveawayDetailsPage(giveaway: giveaway),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink.image(
              image: NetworkImage(giveaway.image),
              height: 150,
              width: MediaQuery.of(context).size.width - 32 - 8,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    giveaway.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  giveaway.worth == 'N/A' ? Container() : SizedBox(height: 8),
                  Text(
                    giveaway.worth == 'N/A' ? '' : giveaway.worth,
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                    ),
                  ),
                  giveaway.worth == 'N/A' ? Container() : SizedBox(height: 8),
                  Text(
                    giveaway.description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
