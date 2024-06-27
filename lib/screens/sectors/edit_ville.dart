import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class UpdateVille extends StatefulWidget {
  const UpdateVille({Key? key}) : super(key: key);

  @override
  State<UpdateVille> createState() => _UpdateVilleState();
}

class _UpdateVilleState extends State<UpdateVille> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: appBarColor,
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
          "Modifier Ville dans Secteur",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                size: 35,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              buildVilleSearch(),
              SizedBox(
                height: 20,
              ),

              //////////////////////////
              Container(
                height: 120,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 15,
                      child: Text('N.livreurs',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    /////////////
                    Positioned(
                      top: 40,
                      left: 15,
                      child: Container(
                        height: 50,
                        width: 150,
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Ali',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.expand_more,
                                  size: 30,
                                )),
                          ],
                        ),
                      ),
                    ),
                    //////////
                    Positioned(
                      top: 40,
                      right: 80,
                      child: Container(
                        height: 50,
                        width: 150,
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Sami',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.expand_more,
                                  size: 30,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ////////
                    Positioned(
                      right: 15,
                      top: 40,
                      child: Container(
                        height: 45,
                        width: 45,
                        child: FloatingActionButton(
                          backgroundColor: orangeColor,
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 15,
                      child: Text('N.Clients',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    /////////////
                    Positioned(
                      top: 40,
                      left: 15,
                      child: Container(
                        height: 50,
                        width: 150,
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Ahmed',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.expand_more,
                                  size: 30,
                                )),
                          ],
                        ),
                      ),
                    ),
                    //////////
                    Positioned(
                      top: 40,
                      right: 80,
                      child: Container(
                        height: 50,
                        width: 150,
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Ala',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.expand_more,
                                  size: 30,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ////////
                    Positioned(
                      right: 15,
                      top: 40,
                      child: Container(
                        height: 45,
                        width: 45,
                        child: FloatingActionButton(
                          backgroundColor: orangeColor,
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ////Button
              Container(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.autorenew_outlined,
                        size: 30,
                      ),
                      Text(
                        'Modifier',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: greenColor,
                      fixedSize: Size(170, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildVilleSearch() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 35, 25, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nom Ville',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            child: TextField(
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.map,
                    color: Color(0xff2A3049),
                  ),
                  suffixIcon: Container(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            constraints:
                                BoxConstraints.tight(Size.fromWidth(30)),
                            onPressed: () {},
                            icon: Icon(Icons.gps_fixed,
                                size: 30, color: orangeColor),
                          ),
                          IconButton(
                            constraints:
                                BoxConstraints.tight(Size.fromWidth(40)),
                            onPressed: () {},
                            icon: Icon(
                              Icons.expand_more,
                              size: 30,
                              color: darkColor,
                            ),
                          ),
                        ],
                      )),
                  hintText: 'Tunis',
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
