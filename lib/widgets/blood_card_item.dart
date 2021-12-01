import 'package:blood_donation/services/blood_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BloodCardItem extends StatelessWidget {
  const BloodCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloodCardData = Provider.of<BloodCard>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GridTile(
        child: InkWell(
          onTap: () {},
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
                                bloodCardData.bloodGroup,
                                style: Theme.of(context).textTheme.headline4,
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
                      margin: EdgeInsets.all(20),
                      height: 50,
                      child: Column(
                        children: [
                          Text(
                            bloodCardData.name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            bloodCardData.nameInMalayam,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
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
    );
  }
}
