import 'package:blood_donation/services/blood_status_card.dart';

import 'package:blood_donation/widgets/status_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final bloodStatusCardData = Provider.of<BloodStatusCards>(context);
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
              : Container(
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
                            )),
                  ),
                 
          ),
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Approved',
                style: TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                  minimumSize: Size(width * 0.5 - 50, 40),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
    ));
  }
}



// import 'package:blood_donation/services/blood_card.dart';
// import 'package:blood_donation/services/blood_status_card.dart';
// import 'package:blood_donation/widgets/blood_card_item.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class StatusScreen extends StatelessWidget {
//   const StatusScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//      final bloodStatusCardData = Provider.of<BloodStatusCards>(context);
//     return Scaffold(
//         body: Container(
//       padding: EdgeInsets.symmetric(horizontal: 30),
//       width: double.infinity,
//       height: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
          

// bloodStatusCardData.items.isEmpty? 

// Container( width: double.infinity,
//             height: height - 250,
        
//             child: Center(child: Text("No Application Found",style: Theme.of(context).textTheme.bodyText1,),))

// :

//           Container(
//             padding: EdgeInsets.only(top: 20),
//             width: double.infinity,
//             height: height - 250,
        
//             child:  GridView.builder(
//               itemCount: bloodStatusCardData.items.length,
//               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 500,
//                 childAspectRatio: 4 / 2,
//                 crossAxisSpacing: 25,
//                 mainAxisSpacing: 25,
//               ),
//               itemBuilder: (ctx, i) => ChangeNotifierProvider<BloodCard>.value(
//                 value: bloodStatusCardData.items[i],
//                 child: BloodCardItem(),
//               ),
//             ),
//           ),
//           Container(
//             height: 80,
//             padding: EdgeInsets.symmetric(vertical: 15),
//             width: double.infinity,
//             child: TextButton(
//                   onPressed: () {
                    
//                   },
//                   child: Text(
//                     'Approved',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   style: TextButton.styleFrom(
//                       minimumSize: Size(width*0.5-50, 40),
//                       backgroundColor: Theme.of(context).colorScheme.onPrimary),
//                 ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
