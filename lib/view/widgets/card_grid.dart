import 'package:blood_donation/model/blood_model.dart';
import 'package:blood_donation/view/widgets/blood_card_item.dart';
import 'package:flutter/material.dart';

class StatusGrid extends StatelessWidget {
 final List<BloodModel> data;
  StatusGrid({required this.data});
  @override
  Widget build(BuildContext context) {
    return data.length == 0 ? Center(child: Text('No Data Found',style: TextStyle(color: Colors.black)),): GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
        ),
        itemBuilder: (ctx, i) => BloodCardItem(data[i]));
  }
}
