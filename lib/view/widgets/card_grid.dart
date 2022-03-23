import 'package:blood_donation/controller/blood_status_card.dart';
import 'package:blood_donation/view/widgets/blood_card_item.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<BloodStatusCards>(context, listen: false);
    final cards = cardData.approvedItems;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: cards.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 4 / 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: cards[i],
        child: BloodCardItem(
          cards[i].id,
        ),
      ),
    );
  }
}
