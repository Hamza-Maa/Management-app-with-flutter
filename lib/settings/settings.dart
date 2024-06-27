import 'package:flutter/material.dart';
import 'account_update.dart';
import 'update_password.dart';
import 'package:app/constants.dart';
// Settings Screen

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  bool isPrefered = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scafoldColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          titleSpacing: 0,
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
            "Paramètres",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            // Compte Container
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                height: 50,
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Compte',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              ///////////
              Divider(),
              ////
              Container(
                height: 170,
                child: Column(
                  children: [
                    //Modifier le pofile Row
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 25, right: 25),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AccountUpdate()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Modifier le profile',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20,
                              color: Colors.black45,
                            )
                          ],
                        ),
                      ),
                    ),
                    ////////////////
                    ///////// Modifier le password
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 25, right: 25),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PasswordUpdate()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Changer Mot de passe',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20,
                              color: Colors.black45,
                            )
                          ],
                        ),
                      ),
                    ),
                    /////////////////////////////

                    ///// Notifications Row
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 40, 0.0, 0.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Notifications',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///////////////
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Column(
                  children: [
                    ////Enable Notifications
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 25, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Notifications',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 18,
                                ),
                              ),
                              //Switch IconButton
                              Switch(
                                  activeColor: darkColor,
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ///////////////////////////////
                    //Preferences Row
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 30, 0.0, 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Preferences',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ////////////////////
                  ],
                ),
              ),
              Divider(),

              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: Column(
                      children: [
                        //Languages Row
                        InkWell(
                          onTap: () {
                            //Do Something
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Languages',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 20,
                                color: Colors.black45,
                              )
                            ],
                          ),
                        ),
                        /////////
                        SizedBox(
                          height: 15,
                        ),

                        ///Dark Mode Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dark Mode',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                              ),
                            ),
                            Switch(
                                activeColor: Color(0xff2A3049),
                                value: isPrefered,
                                onChanged: (value) {
                                  setState(() {
                                    isPrefered = value;
                                  });
                                }),
                          ],
                        ),
                        ////////////
                        SizedBox(
                          height: 15,
                        ),

                        ///Mis a jour Row
                        InkWell(
                          onTap: () {
                            //Do something
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Mise a jour',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                Icons.system_update_alt,
                                size: 20,
                                color: Colors.black45,
                              )
                            ],
                          ),
                        ),
                        /////////////////
                      ],
                    ),
                  ),
                  //Terms Row
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 30, 0.0, 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.description,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Terms',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ////////////////
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 25, right: 25),
                      child: Column(
                        children: [
                          //Privacy policy row
                          InkWell(
                            onTap: () {
                              //Do something
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 20,
                                  color: Colors.black45,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          InkWell(
                            onTap: () {
                              //Do something
                            },
                            //Deconnexion
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: Colors.black45,
                                ),
                                Text(
                                  'Deconnexion',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
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
