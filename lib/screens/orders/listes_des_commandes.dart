import 'package:app/screens/orders/search_orders.dart';
import 'package:app/screens/sectors/secteur_list.dart';

import '../../models/Orders_model.dart';
import '../../providers/Orders_provider.dart';
import '/screens/orders/order_history_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/sector.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key, required this.orders, required this.secteurs}) : super(key: key);

final  List<Order> orders;
final List<Sector> secteurs;

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin {
  DateTime date = DateTime(2022, 12, 24);
  
  late TabController _Controller;
 

  @override
  void initState() {
    super.initState();
    _Controller = TabController(length: widget.secteurs.length, vsync: this, initialIndex: 0);
    _Controller.addListener(_handleTabIndex);
  }

  ////To change floating Button state////////////////
  void _handleTabIndex() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('the number of sectors is: ${widget.secteurs.length}');
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF6F8F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(41, 48, 73, 1),
        ),
        title: Text(
          'Listes des Orders',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(42, 48, 73, 1),
            fontFamily: 'Nunito',
            fontSize: 20,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchCommand(orders: widget.orders,)));
              },
              icon: Icon(
                Icons.search_outlined,
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
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
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
                                controller: _Controller,
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
             controller: _Controller,
             children:  widget.secteurs.map((sector) => ListView(
               children: widget.orders.map((order) => 
                Column(
        children: [ 
          InkWell(
            onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => orderdetail(
          created: order.created_at,
          id: order.id!,
        )));
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10.0, 5.0),
          margin: EdgeInsets.only(top: 10, bottom: 10),
          width: 351,
          height: 100,
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Color.fromRGBO(41, 48, 73, 1),
                        size: 20,
                      ),
                      Text(
                        '${order.client!.first_name}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(97, 109, 126, 1),
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${order.status}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffE7606B),
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '22 Orders',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(41, 48, 73, 1),
                          fontFamily: 'Nunito',
                          fontSize: 11,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${order.total_price}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(41, 48, 73, 1),
                          fontFamily: 'Nunito',
                          fontSize: 20,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Unit',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xffBAC3D5),
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
          ),
          ],
      )
               ).toList(),
             )
             ).toList(),

                ),
                ),
         

        ]),
      ),
    ));
  }

  // Widget commandcard() {
  //   return  ListView.builder(
  //      scrollDirection: Axis.vertical,
  //                   shrinkWrap: true,
  //                  itemCount: widget.orders.length,
  //                  itemBuilder: ((context, index) {
  //                return Column(
  //       children: [ 
  //         InkWell(
  //           onTap: () {
  //       Navigator.of(context)
  //           .push(MaterialPageRoute(builder: (context) => orderdetail(
  //         created: widget.orders[index].created_at,
  //         id: widget.orders[index].id!,
  //       )));
  //     },
  //     child: Container(
  //         padding: EdgeInsets.fromLTRB(10, 10, 10.0, 5.0),
  //         margin: EdgeInsets.only(top: 10, bottom: 10),
  //         width: 351,
  //         height: 100,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           boxShadow: [
  //             BoxShadow(
  //                 color: Color.fromRGBO(0, 0, 0, 0.25),
  //                 offset: Offset(0, 1),
  //                 blurRadius: 4)
  //           ],
  //           color: Color.fromRGBO(247, 249, 253, 1),
  //         ),
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Icon(
  //                       Icons.shopping_bag_outlined,
  //                       color: Color.fromRGBO(41, 48, 73, 1),
  //                       size: 20,
  //                     ),
  //                     Text(
  //                       '${widget.orders[index].client!.first_name}',
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                         color: Color.fromRGBO(97, 109, 126, 1),
  //                         fontFamily: 'Nunito',
  //                         fontSize: 14,
  //                         letterSpacing:
  //                             0 /*percentages not used in flutter. defaulting to zero*/,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Row(
  //                   children: [
  //                     Text(
  //                       '${widget.orders[index].status}',
  //                       textAlign: TextAlign.right,
  //                       style: TextStyle(
  //                         color: Color(0xffE7606B),
  //                         fontFamily: 'Nunito',
  //                         fontSize: 14,
  //                         letterSpacing:
  //                             0 /*percentages not used in flutter. defaulting to zero*/,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 33),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Text(
  //                       '22 Orders',
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                         color: Color.fromRGBO(41, 48, 73, 1),
  //                         fontFamily: 'Nunito',
  //                         fontSize: 11,
  //                         letterSpacing:
  //                             0 /*percentages not used in flutter. defaulting to zero*/,
  //                         fontWeight: FontWeight.normal,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Row(
  //                   children: [
  //                     Text(
  //                       '${widget.orders[index].total_price}',
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                         color: Color.fromRGBO(41, 48, 73, 1),
  //                         fontFamily: 'Nunito',
  //                         fontSize: 20,
  //                         letterSpacing:
  //                             0 /*percentages not used in flutter. defaulting to zero*/,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     Text(
  //                       'Unit',
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                         color: Color(0xffBAC3D5),
  //                         fontSize: 16,
  //                         letterSpacing:
  //                             0 /*percentages not used in flutter. defaulting to zero*/,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ],
  //         )),
  //         ),
  //         ],
  //     );
        
        
  //              }));
 
  // }


}
