


import 'package:blood_donation/controller/dataProvider.dart';
import 'package:blood_donation/view/widgets/card_grid.dart';
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
