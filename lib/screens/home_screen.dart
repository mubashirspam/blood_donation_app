import 'package:blood_donation/services/blood_card.dart';
import 'package:blood_donation/services/blood_cards.dart';
import 'package:blood_donation/widgets/blood_card_item.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final bloodCardData = Provider.of<BloodCards>(context);
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen'),),
        body: Container(
            padding: EdgeInsets.all(25),
            width: double.infinity,
            height: double.infinity,
            child: GridView.builder(
              itemCount: bloodCardData.items.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                childAspectRatio: 4 / 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
              ),
              itemBuilder: (ctx, i) => ChangeNotifierProvider<BloodCard>.value(
                value: bloodCardData.items[i],
                child: BloodCardItem(),
              ),
            )));
  }
}
