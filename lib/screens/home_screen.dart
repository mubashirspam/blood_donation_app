import 'package:blood_donation/DUMMY_DATA.dart';
import 'package:blood_donation/widgets/blood_card_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final routName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.filter_7_rounded,
        //         color: Theme.of(context).colorScheme.secondary,
        //         size: 30,
        //       ),
        //     ),
        //     SizedBox(
        //       width: 25,
        //     ),
        //   ],
        //   leading: Container(
        //     margin: EdgeInsets.only(left: 25),
        //     child: IconButton(
        //         onPressed: () {},
        //         icon: Icon(
        //           Icons.search,
        //           color: Theme.of(context).colorScheme.secondary,
        //           size: 30,
        //         )),
        //   ),
        //   elevation: 0,
        // ),
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_DATA
            .map((blooddata) => BloodCardItem(blooddata.id, blooddata.name,
                blooddata.nameInMalayam, blooddata.bloodGroup, blooddata.age))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
        ),
      ),
    ));
  }
}
