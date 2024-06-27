import '/screens/drivers/modifier_chauffeur.dart';
import 'package:flutter/material.dart';

class DriverList extends StatefulWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  _driver_listState createState() => _driver_listState();
}

class _driver_listState extends State<DriverList> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                'Driver list',
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
                    onPressed: () {},
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
                padding: EdgeInsets.fromLTRB(7.0, 10.0, 0.0, 0.0),
                child: Row(children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = 1;
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Tous les livreur',
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = 2;
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Active',
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = 3;
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Inactif',
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(40.0, 15.0, 0.0, 0.0),
                  child: Row(children: [
                    Text(
                      'Top livreur',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(41, 48, 73, 1),
                          fontFamily: 'Noto Sans',
                          fontSize: 24,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    )
                  ])),
              Container(
                  padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                  child: Row(children: [
                    Text(
                      'Ce mois • Juin 2021',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(186, 195, 213, 1),
                          fontFamily: 'Noto Sans',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    )
                  ])),
              SizedBox(height: 20),
              drivercard(),
              SizedBox(height: 30, width: 351),
              drivercard(),
              SizedBox(height: 30, width: 351),
              drivercard(),
              SizedBox(height: 30, width: 351),
              drivercard(),
              SizedBox(height: 30, width: 351),
              drivercard(),
              SizedBox(height: 30, width: 351),
              drivercard(),
            ]))));
  }

  Widget drivercard() {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10.0, 5.0),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        width: 364,
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(247, 249, 253, 1),
          border: Border.all(
            color: Color.fromRGBO(231, 233, 238, 1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.delivery_dining_outlined,
                      color: Color.fromRGBO(41, 48, 73, 1),
                    ),
                    Text(
                      'Driver name',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(41, 48, 73, 1),
                          fontFamily: 'Noto Sans',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Color.fromRGBO(41, 48, 73, 1),
                      ),
                      iconSize: 20,
                    ),
                    Text(
                      'Active',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color.fromRGBO(41, 48, 73, 1),
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '+ xx xxx xxx',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(120, 126, 148, 1),
                      fontFamily: 'Noto Sans',
                      fontSize: 12,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '1230.4',
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
                Row(
                  children: [
                    Icon(
                      Icons.all_inbox_outlined,
                      color: Color(0xff5599F5),
                      size: 20,
                    ),
                    Text(
                      '22 Commandes',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(41, 48, 73, 1),
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
