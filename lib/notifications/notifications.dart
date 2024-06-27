import 'package:flutter/material.dart';
import 'package:app/constants.dart';
// Notifications Screen

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scafoldColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            "Notifications",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //Do Something
              },
              child: Text(
                "Clear",
                style: TextStyle(color: sunnyColor),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              //Every Notification in a container
              Container(
                height: 60,
                child: ListTile(
                  leading: Icon(Icons.local_shipping_outlined,
                      size: 30, color: Colors.black),
                  title: Text(
                    'Delivery Complet',
                    style: TextStyle(color: greenColor),
                  ),
                  subtitle: Text(
                    'Arrivee de la commande',
                    style: TextStyle(color: Colors.black87),
                  ),
                  trailing: Text('Maitenant'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 60,
                child: ListTile(
                  leading: Icon(Icons.inventory, size: 30, color: Colors.black),
                  title: Text(
                    'product available',
                    style: TextStyle(color: deleteColor),
                  ),
                  subtitle: Text(
                    'produit est en stock',
                    style: TextStyle(color: Colors.black87),
                  ),
                  trailing: Text('25min'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 60,
                child: ListTile(
                  leading:
                      Icon(Icons.edit_outlined, size: 30, color: Colors.black),
                  title: Text(
                    'Changement de status de commange',
                    style: TextStyle(color: redColor),
                  ),
                  trailing: Text('hier'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 60,
                child: ListTile(
                  leading: Icon(Icons.campaign_outlined,
                      size: 30, color: Colors.black),
                  title: Text('une nouvelle promotion'),
                  trailing: Text('hier'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 60,
                child: ListTile(
                  leading: Icon(Icons.local_shipping_outlined,
                      size: 30, color: Colors.black),
                  title: Text('Delivery Complet',
                      style: TextStyle(color: greenColor)),
                  subtitle: Text(
                    'Arrivee de la commande',
                    style: TextStyle(color: Colors.black87),
                  ),
                  trailing: Text('Maitenant'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 60,
                child: ListTile(
                  leading: Icon(Icons.inventory, size: 30, color: Colors.black),
                  title: Text('product available'),
                  subtitle: Text(
                    'produit est en stock',
                    style: TextStyle(color: Colors.black87),
                  ),
                  trailing: Text('25min'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 60,
                child: ListTile(
                  leading: Icon(Icons.create, size: 30, color: Colors.black),
                  title: Text('Changement de status de commange',
                      style: TextStyle(color: redColor)),
                  trailing: Text('hier'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 60,
                child: ListTile(
                  leading: Icon(Icons.campaign_outlined,
                      size: 30, color: Colors.black),
                  title: Text('une nouvelle promotion'),
                  trailing: Text('hier'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 60,
                child: ListTile(
                  leading: Icon(Icons.campaign_outlined,
                      size: 30, color: Colors.black),
                  title: Text('une nouvelle promotion'),
                  trailing: Text('hier'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 60,
                child: ListTile(
                  leading: Icon(
                    Icons.local_shipping_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text('Delivery Complet'),
                  subtitle: Text(
                    'Arrivee de la commande',
                    style: TextStyle(color: Colors.black87),
                  ),
                  trailing: Text('Maitenant'),
                  onTap: () {},
                  enabled: true,
                ),
              ),
              Divider(),
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Marquer tous comme lu',
                          style: TextStyle(fontSize: 15),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              sunnyColor,
                            ),
                            fixedSize:
                                MaterialStateProperty.all(const Size(230, 50)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
