import 'package:blood_donation/services/blood_status_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusCardItem extends StatelessWidget {
  final String id;
  // final String cardId;
  final String name;
  final double contact;
  final double age;
  final String bloodGrupe;

  const StatusCardItem(
    this.id,
    this.name,
    this.age,
    this.contact,
    this.bloodGrupe,

    // this.cardId
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<BloodStatusCards>(context, listen: false).deleteCard(id);
      },
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are Yuo sure?'),
            content: Text(
              'Do you want to delete ?',
            ),
            elevation: 4,
            backgroundColor: Colors.white,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: Text(
                    'No',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child:
                      Text('Yes', style: Theme.of(context).textTheme.bodyText1))
            ],
          ),
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        color: Theme.of(context).errorColor,
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
      ),
      key: ValueKey(id),
      child: Card(
        // margin: EdgeInsets.symmetric(
        //   vertical: 4,
        //   horizontal: 15,
        // ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(fit: BoxFit.cover, child: Text("gg")),
            ),
            title: Text(
              name,
              style: Theme.of(context).textTheme.headline3,
            ),
            subtitle: Text(
              contact.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: Text('Age :${age.toString()}',
                style: Theme.of(context).textTheme.headline3),
          ),
        ),
      ),
    );
  }
}
