// import 'package:app/constants.dart';
// import 'package:flutter/material.dart';

// //  sectors status
// enum Sectors { Tous_les_secteurs, active, inactive }

// //Filters Sectors

// class FilterSectors extends StatefulWidget {

//   String state_of_sector;

//   FilterSectors({required this.state_of_sector});
//   @override
//   State<FilterSectors> createState() => _FilterSectorssState();
// }

// class _FilterSectorssState extends State<FilterSectors> {
//   Sectors _sectors = Sectors.Tous_les_secteurs;

//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: double.infinity,
//       margin: EdgeInsets.only(
//         top: 15,
//       ),
//       padding: EdgeInsets.only(right: 10),
//       child: Padding(
//         padding: const EdgeInsets.only(right: 8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //tous les secteurs
//             Row(
//               children: [
//                 Transform.scale(
//                   scale: 1.3,
//                   child: Radio(
//                     value: Sectors.Tous_les_secteurs,
//                     groupValue: _sectors,
//                     onChanged: (Sectors? value) {
//                       widget.state_of_sector = 'Toutes';
//                       setState(() {
//                         _sectors = value!;
//                         print(' the pressed value is : $_sectors');
//                       });
//                     },
//                     fillColor:
//                         MaterialStateColor.resolveWith((states) => darkColor),
//                   ),
//                 ),
//                 Text(
//                   'Tous les secteurs',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),

//             /////////
//             //Active Sector
//             Row(
//               children: [
//                 Transform.scale(
//                   scale: 1.3,
//                   child: Radio(
//                     value: Sectors.active,
//                     groupValue: _sectors,
//                     onChanged: (Sectors? value) {
//                         widget.state_of_sector = 'Active';
//                       setState(() {
//                         _sectors = value!;
//                         print(' the pressed value is : $_sectors');
//                       });
//                     },
//                     fillColor:
//                         MaterialStateColor.resolveWith((states) => darkColor),
//                   ),
//                 ),
//                 Text(
//                   'Active',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),

//             ////////////
//             //Inactive Sector
//             Row(
//               children: [
//                 Transform.scale(
//                   scale: 1.3,
//                   child: Radio(
//                     value: Sectors.inactive,
//                     groupValue: _sectors,
//                     onChanged: (Sectors? value) {
//                          widget.state_of_sector = 'Inactive';
//                       setState(() {
//                         _sectors = value!;
//                         print(' the pressed value is : $_sectors');
//                       });
//                     },
//                     fillColor:
//                         MaterialStateColor.resolveWith((states) => darkColor),
//                   ),
//                 ),
//                 Text(
//                   'Inactive',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),

//             ////////////
//           ],
//         ),
//       ),
//     );
//   }
// }
