
import 'package:blood_donation/controller/blood_status_card.dart';
import 'package:blood_donation/view/add_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusCardItem extends StatelessWidget {
  final String id;
  // final String cardId;
  final String name;
  final double contact;
  final double age;
  final String bloodGrupe;
  final String nameInMalayalam;
  final bool showAppr = false;

  const StatusCardItem(
    this.id,
    this.name,
    this.age,
    this.contact,
    this.bloodGrupe,
    this.nameInMalayalam,

    // this.cardId
  );

  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<BloodStatusCards>(context, listen: false);
    final cards = cardData.notapprovedItems;
    print("${cards}");
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
            actions: [
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: Text(
                    'No',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
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
        color: Theme.of(context).colorScheme.secondary,
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
                maxRadius: 25,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: bloodGrupe.isEmpty
                          ? Text('Grupe')
                          : Text(
                              bloodGrupe,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                ),
              ),
              title: Text(
                name,
                style: Theme.of(context).textTheme.headline3,
              ),
              subtitle: Text(
                nameInMalayalam,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AddDetailsScreen.routName, arguments: id);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.secondary,
                  ))
              // Text('Age :${age.toString()}',
              //     style: Theme.of(context).textTheme.headline3),
              ),
        ),
      ),
    );
  }
}
