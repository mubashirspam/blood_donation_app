import 'package:blood_donation/services/blood_status_card.dart';

import 'package:blood_donation/widgets/status_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StatusScreen extends StatefulWidget {
  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
 

  var _isLoading = false;
  var _isInit = true;



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
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final bloodStatusCardData = Provider.of<BloodStatusCards>(context);
    return Scaffold(
        body: 
        
        _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.purple.shade100,
                color: Colors.purple,
              ),
            )
          :
        
        
        
         Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          bloodStatusCardData.item.isEmpty
              ? Container(
                  width: double.infinity,
                  height: height - 250,
                  child: Center(
                    child: Text(
                      "No Application Found",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ))
              : RefreshIndicator(
                onRefresh: () => _refreshData(context),
                child: Container(
                    padding: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: height - 250,
                    
                     child: Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                          itemCount: bloodStatusCardData.item.length,
                          itemBuilder: (ctx, i) => StatusCardItem(
                                bloodStatusCardData.item[i].id,
                                bloodStatusCardData.item[i].name,
                               bloodStatusCardData.item[i].age,
                                bloodStatusCardData.item[i].contact,
                                bloodStatusCardData.item[i].bloodGrupe,
                                bloodStatusCardData.item[i].nameInMalayam,
                                
                              )),
                    ),
                   
                        ),
              ),
          // Container(
          //   height: 80,
          //   padding: EdgeInsets.symmetric(vertical: 15),
          //   width: double.infinity,
          //   child: TextButton(
          //     onPressed: () {},
          //     child: Text(
          //       'Approved',
          //       style: TextStyle(fontSize: 16),
          //     ),
          //     style: TextButton.styleFrom(
          //         minimumSize: Size(width * 0.5 - 50, 40),
          //         backgroundColor: Theme.of(context).colorScheme.onPrimary),
          //   ),
          // ),
        ],
      ),
    ),
    );
  }
}



