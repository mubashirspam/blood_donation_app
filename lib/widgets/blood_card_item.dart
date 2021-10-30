import 'package:flutter/material.dart';

class BloodCardItem extends StatelessWidget {
  final String id;
  final String name;
  final String nameInMalayam;
  final String bloodGroup;
  final int age;
  const BloodCardItem(
    this.id,
    this.name,
    this.nameInMalayam,
    this.bloodGroup,
    this.age,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    double widthof = mediaQuery.size.width;

    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
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
                                bloodGroup,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 3),
                                width: 45,
                                height: 1.5,
                                color: Colors.grey.shade300,
                              ),
                              Text(
                                age.toString(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        nameInMalayam,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(widthof.toString())
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    // width: isLandscape ? width * 0.5 - 38 : width - 50,
                    width: width > 1200
                        ? width / 3 - 35
                        : width > 800
                            ? width * 0.5 - 38
                            : width - 50,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.onPrimary),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16)),
                              ),
                            ),
                          ),

                          // TextButton.styleFrom(
                          //   shape: ,
                          //     backgroundColor:
                          //         Theme.of(context).colorScheme.onPrimary),
                          onPressed: () {},
                          icon: Icon(Icons.call),
                          label: Text('call'),
                        ),
                        Container(
                          height: 25,
                          width: 2,
                          color: Colors.white,
                        ),
                        TextButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).colorScheme.onPrimary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(16)),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.call),
                            label: Text('call'))
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
