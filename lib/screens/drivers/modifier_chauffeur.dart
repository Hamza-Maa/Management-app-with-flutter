import 'package:flutter/material.dart';
import 'package:custom_switch_button/custom_switch_button.dart';

class UpdateDriver extends StatefulWidget {
  const UpdateDriver({Key? key}) : super(key: key);

  @override
  _UpdateDriverState createState() => _UpdateDriverState();
}

class _UpdateDriverState extends State<UpdateDriver> {
  bool isChecked = false;
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
          'Update Driver',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(42, 48, 73, 1),
            fontFamily: 'Nunito',
            fontSize: 20,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.check_rounded),
              color: Color(0xff2A3049),
              iconSize: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(35.0, 10.0, 15.0, 10.0),
            child: Row(children: [
              Positioned(
                top: 10,
                left: 2,
                child: Text(
                  'Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(42, 48, 73, 1),
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            width: 340,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              color: Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                color: Color.fromRGBO(210, 215, 222, 1),
                width: 1,
              ),
            ),
            child: TextField(
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Color(0xff6A7993),
                  ),
                  hintText: 'Ahmed hamza',
                  hintStyle: TextStyle(
                    color: Color(0xff2A3049),
                  )),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(35.0, 0.0, 15.0, 10.0),
            child: Row(children: [
              Positioned(
                top: 10,
                left: 2,
                child: Text(
                  'Phone',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(42, 48, 73, 1),
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            width: 340,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              color: Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                color: Color.fromRGBO(210, 215, 222, 1),
                width: 1,
              ),
            ),
            child: TextField(
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                    color: Color(0xff6A7993),
                  ),
                  hintText: '233251512',
                  hintStyle: TextStyle(
                    color: Color(0xff2A3049),
                  )),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(35.0, 0.0, 15.0, 10.0),
            child: Row(children: [
              Positioned(
                top: 10,
                left: 2,
                child: Text(
                  'Crédit limit',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(42, 48, 73, 1),
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            width: 340,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              color: Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                color: Color.fromRGBO(210, 215, 222, 1),
                width: 1,
              ),
            ),
            child: TextField(
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                  prefixIcon: Icon(
                    Icons.credit_card_outlined,
                    color: Color(0xff6A7993),
                  ),
                  hintText: '200',
                  hintStyle: TextStyle(
                    color: Color(0xff2A3049),
                  )),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(35.0, 0.0, 15.0, 10.0),
            child: Row(children: [
              Positioned(
                top: 10,
                left: 2,
                child: Text(
                  'Action',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(42, 48, 73, 1),
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(35.0, 0.0, 15.0, 10.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Désactivé compte livreur',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xff6A7993),
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 20),
                      CustomSwitchButton(
                        backgroundColor: Color.fromRGBO(210, 215, 222, 1),
                        unCheckedColor: Color(0xff6A7993),
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Color(0xff2A3049),
                        buttonHeight: 20,
                        buttonWidth: 40,
                        checked: isChecked,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
