import 'package:blood_donation/controller/dataProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<DataProvider>(context, listen: false);
    final cards = cardData;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 4 / 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),
      itemBuilder: (ctx, i)=> Text('dd')
    );
  }
}
