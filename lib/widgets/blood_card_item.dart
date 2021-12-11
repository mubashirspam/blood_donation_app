import 'package:blood_donation/services/blood_status_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BloodCardItem extends StatelessWidget {
  final String id;

  BloodCardItem(
    this.id,
  );
  final bool showAppr = false;
  bool isAdmin = true;

  @override
  Widget build(BuildContext context) {
    final bloodCardData = Provider.of<StatusCard>(context, listen: false);

    return InkWell(
      highlightColor: Colors.red,
      onLongPress: isAdmin
          ? () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Are Yuo sure?'),
                  content: Text(
                    'Do you want to delete ?',
                  ),
                  elevation: 4,
                  actions: [
                    TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'No',
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {
                          Provider.of<BloodStatusCards>(context, listen: false)
                              .deleteCard(id);
                          Navigator.of(ctx).pop();
                        },
                        child: Text('Yes',
                            style: Theme.of(context).textTheme.bodyText1))
                  ],
                ),
              );
            }
          : () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GridTile(
          child: Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        maxRadius: 35,
                        backgroundColor: Colors.transparent,
                        child: FittedBox(
                          child: Column(
                            children: [
                              Text(
                                bloodCardData.bloodGrupe,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 3),
                                width: 45,
                                height: 1.5,
                                color: Colors.grey.shade300,
                              ),
                              Text(
                                bloodCardData.age.toString(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      margin: EdgeInsets.all(20),
                      height: 70,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                bloodCardData.name,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                bloodCardData.nameInMalayam,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          footer: GridTileBar(
            title: SizedBox(),
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            leading: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                label: Text(
                  "Message",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                )),
            trailing: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                label: Text(
                  "Call",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                )),
          ),
        ),
      ),
    );
  }
}
