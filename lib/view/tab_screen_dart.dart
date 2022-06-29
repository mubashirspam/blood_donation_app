import 'package:blood_donation/controller/dataProvider.dart';
import 'package:blood_donation/view/applay_screen.dart';
import 'package:blood_donation/view/home_screen.dart';
import 'package:blood_donation/view/profile_screen.dart';
import 'package:blood_donation/view/status_screen.dart';
import 'package:blood_donation/view/widgets/drwawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatefulWidget {
  TabScreen({
    Key? key,
  }) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  bool isAdmin = false;
  final List<Map<String, Object>> _pages = [
    {
      'page': ProfileScreen(),
      'title': 'My Profile',
    },
    {
      'page': HomeScreen(),
      'title': 'HomeScreen',
    },
    {
      'page': ApplyScreen(),
      'title': 'Apply New',
    },
    {
      'page': StatusScreen(),
      'title': 'Application Status',
    },
  ];

  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   super.initState();

  //   context.read<DataProvider>().setDonorList(true);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> name = [
      {'title': AppLocalizations.of(context)!.myProfile},
      {
        'title': AppLocalizations.of(context)!.homeScreen,
      },
      {
        'title': AppLocalizations.of(context)!.applyNow,
      },
      {'title': AppLocalizations.of(context)!.applicationStatus},
    ];

    return Scaffold(
      drawer: Option(),
      body: _pages[_selectedIndex]['page'] as Widget,
      appBar: AppBar(
        // leading: Icon(Icons.menu_outlined),
        title: Text(name[_selectedIndex]['title'] as String),
        actions: [
          _selectedIndex == 1
              ? IconButton(
                  icon: Icon(
                    Icons.filter_alt,
                  ),
                  onPressed: () {
                    filter();
                  },
                )
              : Container(),
        ],
        // elevation: _selectedIndex ==1 ?0: 4
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: AppLocalizations.of(context)!.iAm),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: AppLocalizations.of(context)!.homePage,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_chart,
            ),
            label: AppLocalizations.of(context)!.applyNow,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_outlined,
            ),
            label: AppLocalizations.of(context)!.status,
          ),
        ],
      ),
    );
  }

  // BloodList? group;
  Future filter() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Select Blood Group'),
            titlePadding: EdgeInsets.only(top: 15, left: 20),
            actions: [
              Filter(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    child: Text('Serach'),
                    onPressed: () {
                      context.read<DataProvider>().searchDoner(true);
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
            scrollable: true,
          );
        });
  }
}

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  BloodList? group;

  @override
  Widget build(BuildContext context) {
    void setBloodGroupAsGlobal(String bloodGroup) {
      context.read<DataProvider>().setSerchBloodGroup(bloodGroup);
    }

    return Column(
      children: [
        RadioListTile(
            title: Text('AB +ve'),
            value: BloodList.ABP,
            groupValue: group,
            onChanged: (BloodList? bloodList) {
              setState(() {
                setBloodGroupAsGlobal('AB +ve');
                group = bloodList;
              });
            }),
        RadioListTile(
            title: Text('A +ve'),
            value: BloodList.AP,
            groupValue: group,
            onChanged: (BloodList? bloodList) {
              setState(() {
                setBloodGroupAsGlobal('A +ve');
                group = bloodList;
              });
            }),
        RadioListTile(
            title: Text('B +ve'),
            value: BloodList.BP,
            groupValue: group,
            onChanged: (BloodList? bloodList) {
              setState(() {
                setBloodGroupAsGlobal('B +ve');
                group = bloodList;
              });
            }),
        RadioListTile(
            title: Text('AB -ve'),
            value: BloodList.AB,
            groupValue: group,
            onChanged: (BloodList? bloodList) {
              setState(() {
                setBloodGroupAsGlobal('AB -ve');
                group = bloodList;
              });
            }),
        RadioListTile(
            title: Text('A -ve'),
            value: BloodList.A,
            groupValue: group,
            onChanged: (BloodList? bloodList) {
              setState(() {
                group = bloodList;
                setBloodGroupAsGlobal('A -ve');
              });
            }),
        RadioListTile(
            title: Text('B -ve'),
            value: BloodList.B,
            groupValue: group,
            onChanged: (BloodList? bloodList) {
              setState(() {
                group = bloodList;
                setBloodGroupAsGlobal('B -ve');
              });
            }),
        RadioListTile(
            title: Text('O -ve'),
            value: BloodList.O,
            groupValue: group,
            onChanged: (BloodList? bloodList) {
              setState(() {
                group = bloodList;
                setBloodGroupAsGlobal('O -ve');
              });
            }),
        RadioListTile(
            title: Text('O +ve'),
            value: BloodList.OP,
            groupValue: group,
            onChanged: (BloodList? bloodList) {
              setState(() {
                group = bloodList;
                setBloodGroupAsGlobal('O +ve');
              });
            }),
      ],
    );
  }
}

enum BloodList { AP, BP, ABP, OP, A, B, AB, O }

List<String> blodGroup = [
  'A +ve',
  'B +ve',
  'O +ve',
  'AB +ve',
  'AB -ve',
  'A -ve',
  'B -ve',
  'O -ve'
];
