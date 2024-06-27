import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class ClientUpdate extends StatelessWidget {
  const ClientUpdate({Key? key}) : super(key: key);

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
            "Modifier client dans Secteur",
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
            padding: EdgeInsets.fromLTRB(15, 35, 35, 15),
            child: Column(
              children: [
                buildSearch(),
                SizedBox(
                  height: 20,
                ),
                buildSearchClients(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 100),
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
      ),
    );
  }

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
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                )),
          ),
        )
      ],
    );
  }

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
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'client 1',
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.expand_more,
                        size: 30,
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 15,
            ),
            Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(),
                ),
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Visite',
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.expand_more,
                        size: 30,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
