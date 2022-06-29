import 'package:blood_donation/controller/dataProvider.dart';
import 'package:blood_donation/model/blood_model.dart';
import 'package:blood_donation/view/add_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controller/route.dart' as route;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class StatusCardItem extends StatelessWidget {
  final BloodModel bloodModel;

  const StatusCardItem({
    required this.bloodModel,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<DataProvider>(context, listen: false);
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
      key: ValueKey(bloodModel.collectionId),
      child: Card(
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
                    child: Text(
                      '${bloodModel.bloodGrupe}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            title: Text(
              bloodModel.name,
              style: Theme.of(context).textTheme.headline3,
            ),
            subtitle: Text(
              bloodModel.contact.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: context.read<DataProvider>().isAdmin
                ? IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (ctx) => AddDetailsScreen(
                          bloodModel: bloodModel,
                        ),
                      ));
                    },
                    icon: Icon(
                      Icons.check,
                      color: Colors.red,
                    ))
                : bloodModel.isApproved
                    ? Text(
                        AppLocalizations.of(context)!.approved,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    : Text(
                        'Pending',
                        
                        style: TextStyle(color: Colors.red),
                      ),
          ),
        ),
      ),
    );
  }
}
