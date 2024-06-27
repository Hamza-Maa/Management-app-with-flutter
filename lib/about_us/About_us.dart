import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF6F8F9),
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
          "About us",
          style: TextStyle(
            color: Color.fromRGBO(41, 48, 73, 1),
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 50.0),
        children: [
          Text(
            '• A propos de nous:',
            style: TextStyle(
              color: Color(0xff2A3049),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Sweaka is the virtual link between the warehouse, shipment, distribution, and the retailer. It works both ways and is beneficial to all parties.',
            style: TextStyle(
              color: Color(0xff5A6385),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 30),
          Text(
            '• Section title 1: From warehouse to retailer',
            style: TextStyle(
              color: Color(0xff2A3049),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Sweaka helps you control your stock, know your charges, track your inventory, and fulfill your orders successfully. It also keeps you aware of the shipment process and it provides you with insights weekly and monthly using its reporting feature. Sweaka is the platform that ensures that each and every process inside the warehouse runs efficiently and accurately.',
            style: TextStyle(
              color: Color(0xff5A6385),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 30),
          Text(
            '• Section title 2: From retailer to warehouse',
            style: TextStyle(
              color: Color(0xff2A3049),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Sweaka is the platform that keeps you connected with your warehouses. You can easily pass your orders, track their geo-locations, and finalize them. Adding to that, Sweaka 2.0 contains a smart notification system that will remind you to check your stock every once and then to minimize the chance of going out of stock for any product. Sweaka is the tool that will facilitate all your business transactions.',
            style: TextStyle(
              color: Color(0xff5A6385),
              fontSize: 16,
            ),
          ),
        ],
      ),
    ));
  }
}
