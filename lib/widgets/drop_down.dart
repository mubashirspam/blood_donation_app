


// import 'package:flutter/material.dart';

// Container dropDown({required BuildContext context , required String valueb, required List<String> myList}) {
//     return Container(
      
//         height: MediaQuery.of(context).size.height * .065,
//         // width: MediaQuery.of(context).size.width * .5,
//         margin: EdgeInsets.only(left: 18, right: 18),
//         padding: EdgeInsets.only(left: 10, right: 10),
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//             borderRadius: BorderRadius.circular(12),
//             color: Colors.white),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<String>(
//             iconSize: 30,
//             items: myList.map(buildmenuItem).toList(),
//             icon: Icon(
//               Icons.arrow_drop_down,
//               color: Colors.black,
//             ),
//             value: valueb == null ? myList[0] : valueb,
//             onChanged: (value) => setState(() => valueb = value!),
//           ),
//         ));
//   }

//   DropdownMenuItem<String> buildmenuItem(String item) {
//     // setState(() {});
//     return DropdownMenuItem(
//       child: Text(item),
//       value: item,
//     );
//   }
