import '/providers/usernotes_provider.dart';
import '/screens/clients/detail_client.dart';
import '/screens/home/drawer.dart';
import '/screens/home/checkbox_state.dart';
import '/notifications/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/screens/notes/remarques.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final notifications = [
    CheckBoxState(title: 'Clients avec des commandes'),
    CheckBoxState(title: 'Clients avec des chauffeurs'),
    CheckBoxState(title: 'Clients avec des secteurs'),
  ];

  @override
  Widget build(BuildContext context) {
    var userNotesProvider =
        Provider.of<UserNotesProvider>(context, listen: true);
    userNotesProvider.get_notes();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF6F8F9),
        drawer: NavBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Column(
            children: [
              Text(
                'Hi Nararaya',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff2A3049),
                ),
              ),
              Text(
                '            What are you up today?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Color(0xff919FAB),
                ),
              ),
            ],
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notifications()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffF6F8F9),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 370,
                            height: 66,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 32,
                                  left: 0,
                                  child: Container(
                                      width: 370,
                                      height: 34,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                                //border
                                                width: 370,
                                                height: 34,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromRGBO(
                                                            0,
                                                            0,
                                                            0,
                                                            0.10000000149011612),
                                                        offset: Offset(0, 4),
                                                        blurRadius: 4)
                                                  ],
                                                  color: Color.fromRGBO(
                                                      247, 249, 253, 1),
                                                  border: Border.all(
                                                    color: Color(0xffBDC7CF),
                                                    width: 1,
                                                  ),
                                                ))),
                                        Positioned(
                                          top: 13,
                                          left: 13,
                                          child: Text(
                                            'You have ${userNotesProvider.noteList.length} new notes',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    97, 109, 126, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 14,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment(1, 1),
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) => Remarque(
                                                          notes:
                                                              userNotesProvider
                                                                  .noteList)));
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              color: Color(0xff6F7383),
                                            ),
                                            iconSize: 20,
                                          ),
                                        ),
                                      ]))),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Text(
                                  'Remarques',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(42, 48, 73, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ),
                            ]))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  width: 352,
                  height: 130,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 352,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              color: Color.fromRGBO(247, 249, 253, 1),
                            ))),
                    Positioned(
                        top: 95,
                        right: 15,
                        child: Text(
                          '500.24 Unit',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color.fromRGBO(231, 96, 107, 1),
                            fontFamily: 'Nunito',
                            fontSize: 14,
                          ),
                        )),
                    Positioned(
                        top: 16,
                        left: 17,
                        child: Text(
                          'Argent de la journée',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(97, 109, 126, 1),
                            fontFamily: 'Nunito',
                            fontSize: 10,
                          ),
                        )),
                    Positioned(
                      top: 19,
                      left: 303,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xff2A3049),
                        ),
                        iconSize: 20,
                      ),
                    ),
                    Positioned(
                        top: 44,
                        left: 14,
                        child: Text(
                          '2 300.9 Unit',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(97, 109, 126, 1),
                            fontFamily: 'Nunito',
                            fontSize: 30,
                          ),
                        )),
                    Positioned(
                        top: 81,
                        right: 15,
                        child: Text(
                          'Crédit',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(42, 48, 73, 1),
                            fontFamily: 'Nunito',
                            fontSize: 10,
                          ),
                        )),
                    Positioned(
                      top: 16,
                      left: 309,
                      child: SizedBox(),
                    ),
                    Positioned(
                        top: 86,
                        left: 17.170730590820312,
                        child: Text(
                          'Collectée auprès de 12 services.Api.clients',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(97, 109, 126, 1),
                            fontFamily: 'Nunito',
                            fontSize: 10,
                          ),
                        )),
                  ])),
              Container(
                  width: 370,
                  height: 50,
                  child: Stack(children: <Widget>[
                    Positioned(
                      left: 340,
                      child: IconButton(
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => buildSheet(),
                        ),
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: Color(0xff2A3049),
                        ),
                        iconSize: 20,
                      ),
                    ),
                  ])),
              SizedBox(height: 8),
              ClientContainer(),
              SizedBox(height: 20),
              ClientContainer(),
              SizedBox(height: 30),
              ClientContainer(),
              SizedBox(height: 30),
              ClientContainer(),
              SizedBox(height: 30),
              ClientContainer(),
            ],
          ),
        ),
      ),
    );
  }

  //pop up bottom
  Widget buildSheet() => Container(
        height: 241,
        color: Color(0xFF737373),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              )),
          child: buildbotfliter(),
        ),
      );

  Column buildbotfliter() {
    return Column(
      children: [
        ...notifications.map(buildSingleCheckbox).toList(),
        //btn
        RaisedButton(
          elevation: 5,
          onPressed: () => print(' filter'),
          padding: EdgeInsets.fromLTRB(90.0, 20.0, 90.0, 20.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          color: Color(0xff2A3049),
          child: Text(
            'Filter les commandes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }

  CheckboxListTile buildSingleCheckbox(CheckBoxState checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: checkbox.value,
      title: Text(checkbox.title),
      onChanged: (value) => setState(
        () => checkbox.value = value!,
      ),
    );
  }

  Widget ClientContainer() {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailClient(name: '', id: '',)));
      },
      child: Container(
          width: 351,
          height: 100,
          child: Stack(children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 351,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: Color.fromRGBO(247, 249, 253, 1),
                    ))),
            Positioned(
                top: 30,
                left: 17,
                child: Text(
                  '',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(41, 48, 73, 1),
                    fontFamily: 'Nunito',
                    fontSize: 30,
                  ),
                )),
            Positioned(
                top: 14,
                right: 15,
                child: Text(
                  'Boukadir',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color.fromRGBO(186, 195, 213, 1),
                    fontFamily: 'Noto Sans',
                    fontSize: 12,
                  ),
                )),
            Positioned(
              top: 14,
              left: 39,
              child: Text(
                'Client name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(97, 109, 126, 1),
                  fontFamily: 'Noto Sans',
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
                top: 36,
                left: 17.1219482421875,
                child: Text(
                  '+ xx xxx xxx',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(120, 126, 148, 1),
                    fontFamily: 'Noto Sans',
                    fontSize: 12,
                  ),
                )),
            Positioned(
              top: 16,
              left: 309.07318115234375,
              child: SizedBox(),
            ),
            Positioned(
              top: 66,
              left: 17.1219482421875,
              child: Text(
                '232.56 Unit',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(231, 96, 107, 1),
                  fontFamily: 'Nunito',
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 264,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.phone,
                  color: Color(0xff5599F5),
                ),
                iconSize: 20,
              ),
            ),
            Positioned(
              top: 50,
              left: 299,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.map_outlined,
                  color: Color(0xff616D7E),
                ),
                iconSize: 20,
              ),
            ),
          ])),
    );
  }
}
