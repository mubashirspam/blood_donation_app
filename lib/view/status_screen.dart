import 'package:blood_donation/controller/dataProvider.dart';
import 'package:blood_donation/view/widgets/status_card_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class StatusScreen extends StatefulWidget {
  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  void initState() {
    if (context.read<DataProvider>().isAdmin) {
      context.read<DataProvider>().setNoteAprovedrList(false);
    }
    User? user = FirebaseAuth.instance.currentUser;
    context.read<DataProvider>().setAddedDonorList(user?.uid ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (context.read<DataProvider>().isAdmin) {
      return  context.watch<DataProvider>().isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.purple.shade100,
                color: Colors.purple,
              ),
            )
          :Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: double.infinity,
        height: double.infinity,
        child: context.watch<DataProvider>().getNoteAprovedList.length == 0
            ? Center(
                child: Container(
                    width: double.infinity,
                    height: height - 250,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.applyNow,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )),
              )
            : Container(
                padding: EdgeInsets.only(top: 2),
                width: double.infinity,
                height: height - 250,
                child: Consumer<DataProvider>(builder: (context, ntfr, _) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: ntfr.getNoteAprovedList.length,
                      itemBuilder: (ctx, i) => StatusCardItem(
                            bloodModel: ntfr.getNoteAprovedList[i],
                          ));
                })),
      );
    }
    return Scaffold(
      body: context.watch<DataProvider>().isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.purple.shade100,
                color: Colors.purple,
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: double.infinity,
              height: double.infinity,
              child: context.watch<DataProvider>().getAddedBloodList.length == 0
                  ? Center(
                      child: Container(
                          width: double.infinity,
                          height: height - 250,
                          child: Center(
                            child: Text(
                               AppLocalizations.of(context)!.applyNow,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )),
                    )
                  : Container(
                      padding: EdgeInsets.only(top: 2),
                      width: double.infinity,
                      height: height - 250,
                      child:
                          Consumer<DataProvider>(builder: (context, ntfr, _) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: ntfr.getAddedBloodList.length,
                            itemBuilder: (ctx, i) => StatusCardItem(
                                  bloodModel: ntfr.getAddedBloodList[i],
                                ));
                      })),
            ),
    );
  }
}
