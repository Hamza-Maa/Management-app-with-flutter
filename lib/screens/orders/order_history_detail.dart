import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class orderdetail extends StatefulWidget {
  const orderdetail({Key? key, required this.created, required this.id}) : super(key: key);
  final   DateTime? created;
  final String id;

  @override
  _orderdetailState createState() => _orderdetailState();
}

class _orderdetailState extends State<orderdetail> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF6F8F9),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                child: Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff2A3049),
                    ),
                    iconSize: 20,
                  ),
                  Text(
                    'Revue commande',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ])),
            Container(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 0.0, 0.0),
                child: Row(children: [
                  Text(
                   widget.id,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(41, 48, 73, 1),
                      fontFamily: 'Noto Sans',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ])),
            Container(
                padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                child: Row(children: [
                  Text(
                    '${widget.created}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(186, 195, 213, 1),
                      fontFamily: 'Noto Sans',
                      fontSize: 14,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ])),
            Divider(
              color: Color(0xffBAC3D5),
              thickness: 2,
            ),
            Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                      child: Image(
                        image: AssetImage('assets/house.png'),
                      ),
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      )),
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Warehouse name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(41, 48, 73, 1),
                            fontFamily: 'Nunito',
                            fontSize: 12,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Region • city name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(186, 195, 213, 1),
                            fontFamily: 'Noto Sans',
                            fontSize: 10,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 120),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color.fromRGBO(41, 48, 73, 1),
                      ),
                      iconSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'Suivi de commande',
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
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.fromLTRB(29.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = 1;
                      });
                    },
                    activeColor: Color.fromRGBO(41, 48, 73, 1),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'En attente',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(41, 48, 73, 1),
                          fontFamily: 'Nunito',
                          fontSize: 12,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Commande en cours d’acceptation',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(186, 195, 213, 1),
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.fromLTRB(29.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = 2;
                      });
                    },
                    activeColor: Color.fromRGBO(41, 48, 73, 1),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'En attente de livraison',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(41, 48, 73, 1),
                              fontFamily: 'Nunito',
                              fontSize: 12,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        SizedBox(height: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.fromLTRB(29.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = 3;
                      });
                    },
                    activeColor: Color.fromRGBO(41, 48, 73, 1),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'En cours de livraison',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(41, 48, 73, 1),
                              fontFamily: 'Nunito',
                              fontSize: 12,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        SizedBox(height: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'Articles commandee',
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
            ),
            SizedBox(height: 15),
            //articles commandes
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                width: 351,
                height: 75,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 351,
                        height: 100,
                      )),
                  Positioned(
                      top: 30,
                      left: 275,
                      child: Text(
                        '7.99 ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffE7606B),
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )),
                  Positioned(
                      top: 36,
                      left: 315,
                      child: Text(
                        'Unit ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffBAC3D5),
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )),
                  Positioned(
                      top: 17,
                      left: 7,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/orange.png'),
                          ),
                        ],
                      )),
                  Positioned(
                    top: 30,
                    left: 65,
                    child: Text(
                      ' Rita - Orange Juice',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(41, 48, 73, 1),
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 65,
                    child: Text(
                      'Boisson • Bouteille',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xffBAC3D5),
                        fontFamily: 'Nunito',
                        fontSize: 10,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ])),
            Divider(
              color: Color(0xffBAC3D5),
              thickness: 2,
              indent: 35,
              endIndent: 35,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                width: 351,
                height: 75,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 351,
                        height: 100,
                      )),
                  Positioned(
                      top: 30,
                      left: 275,
                      child: Text(
                        '7.99 ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffE7606B),
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )),
                  Positioned(
                      top: 36,
                      left: 315,
                      child: Text(
                        'Unit ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffBAC3D5),
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )),
                  Positioned(
                      top: 17,
                      left: 7,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/orange.png'),
                          ),
                        ],
                      )),
                  Positioned(
                    top: 30,
                    left: 65,
                    child: Text(
                      ' Rita - Orange Juice',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(41, 48, 73, 1),
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 65,
                    child: Text(
                      'Boisson • Bouteille',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xffBAC3D5),
                        fontFamily: 'Nunito',
                        fontSize: 10,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ])),
            Divider(
              color: Color(0xffBAC3D5),
              thickness: 2,
              indent: 35,
              endIndent: 35,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                width: 351,
                height: 75,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 351,
                        height: 100,
                      )),
                  Positioned(
                      top: 30,
                      left: 275,
                      child: Text(
                        '7.99 ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffE7606B),
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )),
                  Positioned(
                      top: 36,
                      left: 315,
                      child: Text(
                        'Unit ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffBAC3D5),
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )),
                  Positioned(
                      top: 17,
                      left: 7,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/orange.png'),
                          ),
                        ],
                      )),
                  Positioned(
                    top: 30,
                    left: 65,
                    child: Text(
                      ' Rita - Orange Juice',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(41, 48, 73, 1),
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 65,
                    child: Text(
                      'Boisson • Bouteille',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xffBAC3D5),
                        fontFamily: 'Nunito',
                        fontSize: 10,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ])),
            Divider(
              color: Color(0xffBAC3D5),
              thickness: 2,
              indent: 35,
              endIndent: 35,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                width: 351,
                height: 75,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 351,
                        height: 100,
                      )),
                  Positioned(
                      top: 30,
                      left: 275,
                      child: Text(
                        '7.99 ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffE7606B),
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )),
                  Positioned(
                      top: 36,
                      left: 315,
                      child: Text(
                        'Unit ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffBAC3D5),
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )),
                  Positioned(
                      top: 17,
                      left: 7,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/orange.png'),
                          ),
                        ],
                      )),
                  Positioned(
                    top: 30,
                    left: 65,
                    child: Text(
                      ' Rita - Orange Juice',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(41, 48, 73, 1),
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 65,
                    child: Text(
                      'Boisson • Bouteille',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xffBAC3D5),
                        fontFamily: 'Nunito',
                        fontSize: 10,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ])),
            Divider(
              color: Color(0xffBAC3D5),
              thickness: 2,
              indent: 35,
              endIndent: 35,
            ),
//total de la commandes

            Container(
              padding: EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'Sous total',
                    style: TextStyle(
                      color: Color.fromRGBO(41, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 13,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 180),
                  Text(
                    '343.23 ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color.fromRGBO(41, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                    ),
                  ),
                  Text(
                    'Unit ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xffBAC3D5),
                      fontFamily: 'Nunito',
                      fontSize: 11,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'TVA',
                    style: TextStyle(
                      color: Color.fromRGBO(41, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 13,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 224),
                  Text(
                    '7.99 ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color.fromRGBO(41, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                    ),
                  ),
                  Text(
                    'Unit ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xffBAC3D5),
                      fontFamily: 'Nunito',
                      fontSize: 11,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'Total de la commande',
                    style: TextStyle(
                      color: Color.fromRGBO(41, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 13,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 100),
                  Text(
                    '350.23 ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color.fromRGBO(41, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Unit ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xffBAC3D5),
                      fontFamily: 'Nunito',
                      fontSize: 11,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
