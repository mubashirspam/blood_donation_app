
import 'package:blood_donation/services/blood_status_card.dart';

import 'package:blood_donation/widgets/card_grid.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var _showOnlyApproved = true;
var _isInit = true;
var _isLoading = false;

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<BloodStatusCards>(context, listen: false)
        .fetchAndSetProducts();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<BloodStatusCards>(context)
          .fetchAndSetProducts()
          .then((_) => setState(() {
                _isLoading = false;
              }));
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.purple.shade100,
                color: Colors.purple,
              ),
            )
          :
          
           RefreshIndicator(
             onRefresh: () => _refreshData(context),
             child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: double.infinity,
                child: StatusGrid(),
               
              ),
           ),
    );
  }
}
