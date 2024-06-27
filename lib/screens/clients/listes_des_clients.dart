import '../../models/Clients_model.dart';
import '../../providers/Clients_provider.dart';
import '/screens/clients/detail_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/providers/sectors_provider.dart';
import 'package:provider/provider.dart';
import '/constants.dart';
import 'ajouter_client.dart';
import 'package:app/models/sector.dart';

class Clients extends StatefulWidget {
 
   final List<Sector> secteurs;
     
  const Clients({Key? key, required this.secteurs}) : super(key: key);


  @override
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients> with TickerProviderStateMixin {
  DateTime date = DateTime(2022, 12, 24);
     

  late TabController _tabController;
 

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.secteurs.length, vsync: this, initialIndex: 0);
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

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: scafoldColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Clients',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(42, 48, 73, 1),
              fontSize: 20,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddClient()),
                  );
                },
                icon: Icon(
                  Icons.person_add_alt_1,
                  color: Color(0xff2A3049),
                ),
                iconSize: 27,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: EdgeInsets.fromLTRB(29.0, 10.0, 0.0, 0.0),
                child: Row(children: [
                  Text(
                    "Today",
                    //*('${date.year}/${date.month}/${date.day}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xffBAC3D5),
                      fontFamily: 'Nunito',
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(248.0, 0.0, 0.0, 2.0),
                    child: IconButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (newDate == null) return;
                        setState(() => date = newDate);
                      },
                      icon: Icon(
                        Icons.calendar_today,
                        color: Color(0xff2A3049),
                      ),
                      iconSize: 27,
                    ),
                  ),
                ])),
            Divider(
              color: Color(0xffBAC3D5),
              thickness: 2,
              indent: 35,
              endIndent: 35,
            ),
            SizedBox(height: 8),
            Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    child: DefaultTabController(
                      initialIndex: 1,
                      length: widget.secteurs.length,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          //This is for background color
                          color: Colors.white.withOpacity(0.0),
                          //This is for bottom border that is needed
                          border: Border(
                            bottom: BorderSide(color: Colors.white, width: 0.4),
                          ),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            TabBar(
                                isScrollable: true,
                                indicatorColor: Colors.black,
                                controller: _tabController,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorWeight: 3.0,
                                labelColor: Colors.black,
                                labelStyle: TextStyle(
                                  fontSize: 16.0,
                                 
                                ),
                                // unselectedLabelStyle: TextStyle(fontSize: 10.0, color: Colors.black26,),
                                tabs: widget.secteurs.map((sector) => Tab(text: sector.name),).toList(),
                                
                                ),
                          ], 
                        ),
                      ),
                    ),
                  ),
                ]),
            SizedBox(height: 20),
            SizedBox(
              height: 600,
              child: TabBarView(
                controller: _tabController,
                children: widget.secteurs.map((sector) => ListView(
                  children: (sector.clients).map((client) => Column(
                      children: [
                        InkWell(
                   onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailClient(
              name: client.first_name, 
              id: client.id!,)));
      },
                          child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10.0, 5.0),
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              width: 364,
                              height: 115,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0, 1),
                                      blurRadius: 4)
                                ],
                                color: Color.fromRGBO(247, 249, 253, 1),
                              ),
                              child:  Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person_outline_outlined,
                                              size: 30,
                                            ),
                                            Text(
                                              '${client.first_name}',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color:
                                                    Color.fromRGBO(97, 109, 126, 1),
                                                fontFamily: 'Noto Sans',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${client.city}',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color.fromRGBO(186, 195, 213, 1),
                                            fontFamily: 'Noto Sans',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${client.phone}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Color.fromRGBO(120, 126, 148, 1),
                                            fontFamily: 'Noto Sans',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${client.money}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Color.fromRGBO(231, 96, 107, 1),
                                            fontSize: 20,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.phone,
                                                color: Color(0xff5599F5),
                                              ),
                                              iconSize: 20,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.map_outlined,
                                                color: Color(0xff616D7E),
                                              ),
                                              iconSize: 20,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                        ),
                      ],
                    ),).toList(),
                )).toList()
              ),
            ),
          ]),
        ),
      ),
    );
  }

  // Widget ClientContainer() {
  // return ListView.builder(
  //   itemCount: widget.secteurs.length,
  //   itemBuilder: ((context, index) {
  //       return  ListTile(
  //         title: Text('${widget.secteurs[index].clients}'),
  //       );
  //   }));
    
  // }
}




// FutureBuilder(
//           future: Provider.of<ClientsProvider>(context).get_clients(),
//           builder:
//               (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
//             if (snapshot.hasData) {
//               List<Client> clientsList = snapshot.data!;
//               return Column(
//                   children: clientsList.map(
//                     (Client client) => Column(
//                       children: [
//                         InkWell(
//                    onTap: () {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => DetailClient(
//               name: client.first_name, 
//               id: client.id!,)));
//       },
//                           child: Container(
//                               padding: EdgeInsets.fromLTRB(10, 10, 10.0, 5.0),
//                               margin: EdgeInsets.only(top: 10, bottom: 10),
//                               width: 364,
//                               height: 115,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Color.fromRGBO(0, 0, 0, 0.25),
//                                       offset: Offset(0, 1),
//                                       blurRadius: 4)
//                                 ],
//                                 color: Color.fromRGBO(247, 249, 253, 1),
//                               ),
//                               child:  Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Icon(
//                                               Icons.person_outline_outlined,
//                                               size: 30,
//                                             ),
//                                             Text(
//                                               '${client.first_name}',
//                                               textAlign: TextAlign.left,
//                                               style: TextStyle(
//                                                 color:
//                                                     Color.fromRGBO(97, 109, 126, 1),
//                                                 fontFamily: 'Noto Sans',
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Text(
//                                           '${client.city}',
//                                           textAlign: TextAlign.right,
//                                           style: TextStyle(
//                                             color: Color.fromRGBO(186, 195, 213, 1),
//                                             fontFamily: 'Noto Sans',
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           '${client.phone}',
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             color: Color.fromRGBO(120, 126, 148, 1),
//                                             fontFamily: 'Noto Sans',
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           '${client.money}',
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             color: Color.fromRGBO(231, 96, 107, 1),
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             IconButton(
//                                               onPressed: () {},
//                                               icon: Icon(
//                                                 Icons.phone,
//                                                 color: Color(0xff5599F5),
//                                               ),
//                                               iconSize: 20,
//                                             ),
//                                             IconButton(
//                                               onPressed: () {},
//                                               icon: Icon(
//                                                 Icons.map_outlined,
//                                                 color: Color(0xff616D7E),
//                                               ),
//                                               iconSize: 20,
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                         ),
//                       ],
//                     ),
//                   ).toList(),
//                 );
              
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           })