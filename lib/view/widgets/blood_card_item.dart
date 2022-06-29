import 'package:blood_donation/controller/dataProvider.dart';
import 'package:blood_donation/controller/constants.dart';
import 'package:blood_donation/controller/utls.dart';
import 'package:blood_donation/model/blood_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class BloodCardItem extends StatelessWidget {
  final BloodModel bloodmodel;

  BloodCardItem(
    this.bloodmodel,
  );
  final bool showAppr = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.red,
      onLongPress: context.read<DataProvider>().isAdmin
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
                          context
                              .read<DataProvider>()
                              .deleteDonor(bloodmodel.collectionId);
                          context.read<DataProvider>().setDonorList(true);

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
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: -MediaQuery.of(context).size.height * 0.028,
                  child: Row(
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
                                  '${bloodmodel.bloodGrupe}',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 3),
                                  width: 45,
                                  height: 1.5,
                                  color: Colors.grey.shade300,
                                ),
                                Text(
                                  '${bloodmodel.age}',
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
                                  '${bloodmodel.name}',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  '${bloodmodel.contact}',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          footer: GridTileBar(
            title: SizedBox(),
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            leading: TextButton.icon(
                onPressed: () {
                  Utils().launchInBrowser(
                      "https://wa.me/+91${bloodmodel.contact}");
                },
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                label: Text(
                  AppLocalizations.of(context)!.message,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                )),
            trailing: TextButton.icon(
                onPressed: () {
                  Utils().makePhoneCall("${bloodmodel.contact}");
                },
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                label: Text(
                  AppLocalizations.of(context)!.call,
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
