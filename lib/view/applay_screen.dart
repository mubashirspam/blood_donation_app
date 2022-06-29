
import 'package:blood_donation/view/add_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ApplyScreen extends StatelessWidget {
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
               AppLocalizations.of(context)!.newApplication,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "വടവുകോട്‌ പുത്തെൻകുരിശ് ഗ്രാമപഞ്ചായത്തിലെ ഒന്നാം വാർഡിലെ ജനങ്ങൾ ആരംഭിച്ച ഗ്രാമഫോൺ കൂട്ടായ്മയുടെ രക്തദാന സേനയുടെ മൊബൈൽ ആപ്ലിക്കേഷൻ ആണ് ഇത്, രക്തം നൽകുവാനായി ആപ്ലിക്കേഷൻ ഫിൽ ചെയുക",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextButton(

              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AddDetailsScreen.routName, arguments: 'new');
              },
              child: Text(
               AppLocalizations.of(context)!.applyNow,
                
                style: TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  // backgroundColor: Theme.of(context).colorScheme.onPrimary,
                elevation: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
