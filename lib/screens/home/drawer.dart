import 'package:app/notifications/notifications.dart';
import 'package:app/providers/Orders_provider.dart';
import 'package:app/providers/sectors_provider.dart';

import '/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../settings/settings.dart';
import '../clients/listes_des_clients.dart';
import '../drivers/driver_list.dart';
import '../orders/listes_des_commandes.dart';
import '../sectors/secteur_list.dart';
import 'package:app/settings/account_update.dart';
import 'package:provider/provider.dart';
class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sectorsProvider = Provider.of<SectorsProvider>(context);
    sectorsProvider.get_sectors();
    var orderProvider = Provider.of<OrdersProviders>(context);
    orderProvider.get_Orders();
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              curve: Curves.easeIn,
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: BackButton(),
                    ),
                    Text(
                      'Retour',
                      style: TextStyle(
                        color: Color.fromRGBO(41, 48, 73, 1),
                        fontSize: 18,
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: 270,
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffF6F8F9),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage('assets/a.png'),
                          ),
                          title: Text(
                            'Ahmed',
                            style: TextStyle(
                              color: Color.fromRGBO(41, 48, 73, 1),
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            'Wickelbelg',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(120, 126, 148, 1),
                              fontFamily: 'Noto Sans',
                              fontSize: 14,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AccountUpdate()));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(41, 48, 73, 1),
                            ),
                            iconSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              iconColor: Color(0xff2A3049),
              title: Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()))
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              iconColor: Color(0xff2A3049),
              title: Text(
                'Customers',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Clients(secteurs: sectorsProvider.sectorList ,)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              iconColor: Color(0xff2A3049),
              title: Text(
                'Sectors',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Secteurs(sectors: sectorsProvider.sectorList,)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.inventory_rounded),
              iconColor: Color(0xff2A3049),
              title: Text(
                'Bills',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => null,
            ),
            Divider(
              indent: 19,
              endIndent: 19,
            ),
            ListTile(
              leading: Icon(Icons.list_alt_outlined),
              iconColor: Color(0xff2A3049),
              title: Text(
                'Orders',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orders(
                    orders: orderProvider.orderList,
                    secteurs: sectorsProvider.sectorList,
                    )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_shipping_outlined),
              iconColor: Color(0xff2A3049),
              title: Text(
                'Drivers',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriverList()),
                );
              },
            ),
            Divider(
              indent: 19,
              endIndent: 19,
            ),
            ListTile(
              leading: Icon(Icons.map_outlined),
              iconColor: Color(0xff2A3049),
              title: Text(
                'See map',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => null,
            ),
            Divider(
              indent: 19,
              endIndent: 19,
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              iconColor: Color(0xff2A3049),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
              },
              trailing: ClipOval(
                child: Container(
                    color: Colors.red,
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Text(
                        '8',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              iconColor: Color(0xff2A3049),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            Divider(
              indent: 19,
              endIndent: 19,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              iconColor: Color(0xff2A3049),
              title: Text(
                'Log out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
