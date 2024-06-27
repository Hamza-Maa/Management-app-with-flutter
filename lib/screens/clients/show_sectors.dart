import 'package:app/constants.dart';
import 'package:app/providers/sectors_provider.dart';
import 'package:provider/provider.dart';
import '/screens/sectors/secteur_list.dart';
import 'package:flutter/material.dart';
import '/models/sector.dart';

class ShowSectors extends StatefulWidget {
  // final List<Sector> secteurs = [
  //   Sector(
  //       name: 'Secteur name',
  //       sellerName: 'Seller Name',
  //       display_id: 0,
  //       is_active: false, 
  //       cities: [],
  //       clients: [],
  //       ),
      
  //   Sector(
  //       name: 'Secteur name',
  //       sellerName: 'Seller Name',
  //       display_id: 0,
  //       is_active: false,
  //       cities: [], 
  //           clients: [],
  //       ),
  //   Sector(
  //       name: 'Secteur name',
  //       sellerName: 'Seller Name',
  //       display_id: 0,
  //       is_active: false,
  //       cities: [],
  //           clients: [], 
  //       ),
  //   Sector(
  //       name: 'Secteur name',
  //       sellerName: 'Seller Name',
  //       display_id: 0,
  //       is_active: false, 
  //       cities: [],
  //           clients: [],
  //       ),
  //   Sector(
  //       name: 'Secteur name',
  //       sellerName: 'Seller Name',
  //       display_id: 0,
  //       is_active: false,
  //       cities: [], 
  //           clients: [],
  //       ),
  // ];

  @override
  State<ShowSectors> createState() => _ShowSectorsState();
}

class _ShowSectorsState extends State<ShowSectors> {
  @override
  Widget build(BuildContext context) {
     var sectorProvider = Provider.of<SectorsProvider>(context);
     sectorProvider.get_sectors();
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: sectorProvider.sectorList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Row(children: [
                Container(
                  height: 60,
                  child: Column(
                    children: [
                      Text(
                        '${sectorProvider.sectorList[index].name}',
                        style: TextStyle(color: darkColor, fontSize: 18),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: Text(
                            '${sectorProvider.sectorList[index].sellerName}',
                            style:
                                TextStyle(color: Colors.black26, fontSize: 15),
                          )),
                    ],
                  ),
                ),
              ]),
            );
          }),
    );
  }
}
