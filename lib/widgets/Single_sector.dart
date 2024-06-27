import 'package:app/constants.dart';
import 'package:app/providers/sectors_provider.dart';
import 'package:flutter/material.dart';
import '/screens/sectors/sector_update.dart';
import 'package:provider/provider.dart';

class SingleSector extends StatefulWidget {
  @override
  State<SingleSector> createState() => _SingleSectorState();
}

class _SingleSectorState extends State<SingleSector> {
//bool is_active = false;
///////////Delete Dialogue ////////////////////////
  showAlertDialog(BuildContext context) {
    Widget alert = Center(
      child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 160,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  child: Text(
                    'Are you sure ?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: Container(
                  child: Text(
                    'Would you like to continue?',
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 50,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Annuler',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: darkColor,
                          fixedSize: Size(160, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Do Something!
                      },
                      child: Text(
                        'Supprimer',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: deleteColor,
                          fixedSize: Size(130, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
////////////////End Delete Dialogue///////////////////////////

// Single Sector container///////////

  @override
  Widget build(BuildContext context) {
    var sectorsProvider = Provider.of<SectorsProvider>(context);
    sectorsProvider.get_sectors();
    
   
   
    return ListView.builder(
        shrinkWrap: true,
        itemCount: sectorsProvider.sectorList.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Container(
                  height: 225,
                  width: 400,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 6, right: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ' ${sectorsProvider.sectorList[index].is_active == false ? 'Inactive' : 'Active'}',
                          style: sectorsProvider.sectorList[index].is_active ==
                                  false
                              ? TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: deleteColor)
                              : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: greenDarkColor,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '${sectorsProvider.sectorList[index].name}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '${sectorsProvider.sectorList[index].created_at}',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                              ),
                            ],
                          ),
                          //Edit and Delete Buttons Row
                          Row(
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SectorUpdate(
                                                    name: sectorsProvider.sectorList[index].name,
                                                    clients: sectorsProvider.sectorList[index].clients,
                                                    cities: sectorsProvider.sectorList[index].cities,
                                                    is_active: sectorsProvider.sectorList[index].is_active,
                                                    created_at: sectorsProvider.sectorList[index].created_at!,
                                                  )));
                                    },
                                    icon: Icon(
                                      Icons.edit_note_outlined,
                                      size: 35,
                                      color: orangeColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showAlertDialog(context);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 35,
                                      color: deleteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'N.viles',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${sectorsProvider.sectorList[index].cities.length}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: greenDarkColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                              height: 80,
                              child: VerticalDivider(color: Colors.grey)),
                          Column(
                            children: [
                              Text(
                                'N.clients',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${sectorsProvider.sectorList[index].clients.length}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: greenDarkColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                              height: 80,
                              child: VerticalDivider(color: Colors.grey)),
                          Column(
                            children: [
                              Text(
                                'Vendeur',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '-',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: greenDarkColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
