

import 'package:app/constants.dart';
import 'package:app/models/Clients_model.dart';
import 'package:flutter/material.dart';
import 'add_client.dart';
import 'add_ville.dart';
import 'edit_client.dart';
import 'edit_ville.dart';
import 'package:app/models/city_model.dart';

class SectorUpdate extends StatefulWidget {
   final List<Client> clients;
   final List<City> cities;
   String name;
   bool is_active;
   DateTime created_at;

   SectorUpdate({ required this.clients, required this.cities, required this.name, required this.is_active, required this.created_at});

  @override
  State<SectorUpdate> createState() => _SectorUpdateState();
}

class _SectorUpdateState extends State<SectorUpdate>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  ////To change floating Button state////////////////
  void _handleTabIndex() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: Container(
                  child: Text(
                    'Would you like to continue?',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        decoration: TextDecoration.none),
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

  @override
  Widget build(BuildContext context) {
    //print(widget.clients.length);
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: scafoldColor,
          appBar: AppBar(
            titleSpacing: 0,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            backgroundColor: appBarColor,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            title: Text(
              "Modifier le Secteur",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
              child: Column(
                children: [
                  //////////// Row of sector Name and Active status///////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${widget.created_at}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.layers_outlined,
                                size: 30,
                                color: greenDarkColor,
                              ),
                              Text(
                                '${widget.name}',
                                style: TextStyle(
                                  color: Color.fromARGB(192, 1, 168, 82),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          '${widget.is_active == false ? 'Inactive' : 'Active'}',
                          style: widget.is_active ==
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
                    ],
                  ),
                  //////////////// End Row //////////////////////////////////////////////
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  //////////////////Tabs Controller //////////////////////////////////////
                  DefaultTabController(
                    initialIndex: 1,
                    length: 2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        //This is for background color
                        color: Colors.white.withOpacity(0.0),
                        //This is for bottom border that is needed
                        border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 0.4)),
                      ),
                      child: TabBar(
                          indicatorColor: sunnyColor,
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 3.0,
                          unselectedLabelStyle: TextStyle(color: Colors.grey),
                          tabs: [
                            Tab(
                              child: Text(
                                'Clients',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Viles',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  ////////////////////End Tab Controller //////////////////////////////////////////
                  SizedBox(
                    height: 20,
                  ),
                  //////////////////TabBarView Content (List of Clients and Villes)////////////////////////////
                  Container(
                    height: 360,
                    child: TabBarView(controller: _tabController, children: [
                      buildClientView(),
                      buildVilleView(),
                    ]),
                  ),

                  //////////////////////End TabBarView//////////////////////////////////////////////

                  ///////////////Condition to change FloatingButton State//////////////////////
                  _tabController.index == 0
                      ? Container(
                          padding:
                              EdgeInsets.only(top: 10, right: 20, bottom: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: orangeColor,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => AddClient()));
                                  },
                                  child: Icon(
                                    Icons.person_add_alt,
                                    size: 25,
                                  ),
                                ),
                              ]),
                        )
                      : Container(
                          padding:
                              EdgeInsets.only(top: 10, right: 20, bottom: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: orangeColor,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => AddVille()));
                                  },
                                  child: Icon(
                                    Icons.add_location_alt,
                                    size: 25,
                                  ),
                                ),
                              ]),
                        ),
                  ///////////////////////End Condition////////////////////////////////////////
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

///////////////Clients Cards View /////////////////////////////////
  Widget buildClientView() {
    return widget.clients.isNotEmpty ? ListView.builder(
      shrinkWrap: true,
      itemCount: widget.clients.length,
      itemBuilder: (context, item){
        return   Column(
          children: [
            ///////Container which Contains Client Card////////////
            Container(
              height: 130,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Active',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: greenDarkColor),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(bottom: 18),
                                      child: Icon(
                                        Icons.person_outline_outlined,
                                        size: 30,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${widget.clients[item].first_name}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'Visite',
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 18),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ClientUpdate()));
                                      },
                                      icon: Icon(
                                        Icons.edit_note_outlined,
                                        size: 35,
                                        color: orangeColor,
                                      )),
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
                                      icon: Icon(Icons.delete,
                                          size: 35, color: deleteColor)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ////////////////End Of Container ////////////////////////////////////////
           
          ],
        );
      },
    ): Center(child: Text('No data'),);
   
      
     
  
  }

  ////VILLE   Cards  View////////////////
  Widget buildVilleView() {
    return  widget.cities.isNotEmpty ?  ListView.builder(
      shrinkWrap: true,
      itemCount: widget.cities.length,
      itemBuilder: (context, index){
        return  Column(
          children: [
            ///////////////////Container which contains Ville Card //////////////////////////////////
            Container(
              height: 130,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 25.0, 8.0, 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(bottom: 40),
                                      child: Icon(
                                        Icons.map,
                                        size: 30,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${widget.cities[index].name}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'N.services',
                                    style: TextStyle(
                                        color: sunnyColor, fontSize: 18),
                                  ),
                                  Text(
                                    'N.Livreurs',
                                    style: TextStyle(
                                        color: skyColor, fontSize: 18),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateVille()));
                                      },
                                      icon: Icon(
                                        Icons.edit_note_outlined,
                                        size: 35,
                                        color: orangeColor,
                                      )),
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
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ) : 
    Center(child: Text('No Data')
    );
  }
}
