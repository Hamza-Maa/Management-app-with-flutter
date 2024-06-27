import 'package:app/constants.dart';
import 'package:flutter/material.dart';

// Add ville Screen
class AddVille extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scafoldColor,
        appBar: AppBar(
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
            "Ajouter Ville dans secteur",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 35, 25, 15),
            child: Column(
              children: [
                buildVilleSearch(),
                SizedBox(
                  height: 25,
                ),
                buildSearchVilles(),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Nom ville TextField
  Widget buildVilleSearch() {
    return Column(
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
                color: darkColor,
              ),
              suffixIcon: Container(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        constraints: BoxConstraints.tight(Size.fromWidth(30)),
                        onPressed: () {},
                        icon: Icon(
                          Icons.gps_fixed,
                          size: 30,
                          color: orangeColor,
                        ),
                      ),
                      IconButton(
                        constraints: BoxConstraints.tight(Size.fromWidth(40)),
                        onPressed: () {},
                        icon: Icon(
                          Icons.expand_more,
                          size: 30,
                          color: Color(0xff2A3049),
                        ),
                      ),
                    ],
                  )),
              hintText: 'Choose a location',
              hintStyle: TextStyle(
                color: Colors.black26,
                fontSize: 15,
              ),
            ),
          ),
        )
      ],
    );
  }

  ///////////////// Listes des villes////////////
  Widget buildSearchVilles() {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Listes des villes',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            //////////Ville Name Container///////
            Container(
              padding: EdgeInsets.only(left: 10, top: 6, bottom: 8),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 2.0),
              ),
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'nom de ville',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2 livreurs',
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                      Container(
                          height: 20,
                          child: VerticalDivider(color: Colors.black54)),
                      Text(
                        '4 services.Api.clients',
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 6, bottom: 8),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
              ),
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'nom de ville',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2 livreurs',
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                      Container(
                          height: 20,
                          child: VerticalDivider(color: Colors.black54)),
                      Text(
                        '4 services.Api.clients',
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 6, bottom: 8),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
              ),
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'nom de ville',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2 livreurs',
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                      Container(
                          height: 20,
                          child: VerticalDivider(color: Colors.black54)),
                      Text(
                        '4 services.Api.clients',
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 6, bottom: 8),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
              ),
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'nom de ville',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2 livreurs',
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                      Container(
                          height: 20,
                          child: VerticalDivider(color: Colors.black54)),
                      Text(
                        '4 services.Api.clients',
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
