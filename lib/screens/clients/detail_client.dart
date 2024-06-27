import 'package:app/constants.dart';
import 'package:app/screens/clients/ajouter_client.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '/screens/clients/last_ordered.dart';
import '/screens/clients/show_sectors.dart';
import '/widgets/named_icon.dart';

class DetailClient extends StatefulWidget {
  
  const DetailClient({Key? key, required this.name, required this.id}) : super(key: key);
final String name;
final String id;
  @override
  State<DetailClient> createState() => _DetailClientState();
}

class _DetailClientState extends State<DetailClient>
    with TickerProviderStateMixin {
  // final List<String> dates =[
  //                    'Tous',
  //                   'This week',
  //                   'this month',
  //                    'last week',
  //                    'last month',
  //  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
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
    print('id of client is : ${widget.id}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: scafoldColor,
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: appBarColor,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            widget.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddClient.routeName, arguments: widget.id);
              },
              icon: Icon(
                Icons.edit,
                size: 30,
              ),
            ),
            NamedIcon(
              iconData: Icons.description,
              notificationCount: 3,
              onTap: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                //////Percent Indicator
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        margin: EdgeInsets.only(left: 10, right: 8, top: 25),
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 234, 236, 244),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Objectif',
                                      style: TextStyle(
                                          fontSize: 18, color: darkColor),
                                    ),
                                    Text(
                                      'of this period',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Text(
                                  '34%',
                                  style:
                                      TextStyle(fontSize: 25, color: darkColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                LinearPercentIndicator(
                                    width: 370,
                                    lineHeight: 4.0,
                                    percent: 0.34,
                                    progressColor: darkColor,
                                    backgroundColor: Colors.white)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                ////////////////// End Percent//////////////////////
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: DefaultTabController(
                          initialIndex: 1,
                          length: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              //This is for background color
                              color: Colors.white.withOpacity(0.0),
                              //This is for bottom border that is needed
                              border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 0.4),
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
                                    labelStyle: TextStyle(
                                      fontSize: 22.0,
                                    ),
                                    // unselectedLabelStyle: TextStyle(fontSize: 10.0, color: Colors.black26,),
                                    tabs: [
                                      Tab(
                                        child: Text(
                                          'Tous',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'this week',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black38,
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'this month',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black38),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'last week',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black38),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'last month',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black38),
                                        ),
                                      )
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      //    Divider(
                      //    indent: 6.0,
                      //    endIndent: 6.0,
                      //    thickness: 3.0,
                      //    color: Colors.grey[400],
                      //  ),

                      SizedBox(
                        height: 580,
                        child:
                            TabBarView(
                              controller: _tabController, children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildContainer(
                                        Icons.attach_money_outlined,
                                        12,
                                        'Purchases',
                                        purchaseColor,
                                        avatarPurchaseColor),
                                    buildContainer(Icons.shop_outlined, 12,
                                        'Orders', orderColor, avatarOrderColor),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Secteurs',
                                          style: TextStyle(
                                              fontSize: 25, color: darkColor),
                                        ))),
                                // Secteurs
                                ShowSectors(),

                                OrderedProducts(),
                              ],
                            ),
                          ),
                          Center(
                            child: Text('No Data'),
                          ),
                          Center(
                            child: Text('No Data'),
                          ),
                          Center(
                            child: Text('No Data'),
                          ),
                          Center(
                            child: Text('No Data'),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer(
      IconData icon, int number, String field, Color color, Color backColor) {
    return Container(
        height: 120,
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
                backgroundColor: backColor,
                radius: 30,
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.white,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${number}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                ),
                Text(
                  field,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            )
          ],
        ));
  }
}
