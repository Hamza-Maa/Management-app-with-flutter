import 'dart:ui';

import 'package:app/constants.dart';
import 'package:flutter/material.dart';

// Add client Screen

class AddClient extends StatelessWidget {
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
            "Ajouter Client dans secteur",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 35, 35, 15),
            child: Column(
              children: [
                buildSearch(),
                SizedBox(
                  height: 15,
                ),
                buildSearchClients()
              ],
            ),
          ),
        ),
      ),
    );
  }

// build Search TextField

  Widget buildSearch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
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
                  Icons.person_outline,
                  color: darkColor,
                ),
                hintText: 'Entrer client name',
                hintStyle: TextStyle(color: Colors.black45)),
          ),
        )
      ],
    );
  }
////////////////////////////

// Listes des services.Api.clients

  Widget buildSearchClients() {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Listes des services.Api.clients',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 2.0),
                ),
                height: 50,
                child: Text(
                  'Ahmed Ala',
                  style: TextStyle(fontSize: 16),
                )),

            ///
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(),
                ),
                height: 50,
                child: Text(
                  'Hamza Ala',
                  style: TextStyle(fontSize: 16),
                )),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 2.0),
                ),
                height: 50,
                child: Text(
                  'Ahmed Ala',
                  style: TextStyle(fontSize: 16),
                )),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(),
                ),
                height: 50,
                child: Text(
                  ' Hamza Ala',
                  style: TextStyle(fontSize: 16),
                )),
          ],
        ),
      ],
    );
  }
}
