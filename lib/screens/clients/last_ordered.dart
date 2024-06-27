import 'package:app/constants.dart';
import 'package:flutter/material.dart';

//////Show Model bottom sheet of last ordered products ////////////////////////

class OrderedProducts extends StatefulWidget {
  const OrderedProducts({Key? key}) : super(key: key);

  @override
  State<OrderedProducts> createState() => _OrderedProductsState();
}

class _OrderedProductsState extends State<OrderedProducts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
            color: scafoldColor,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Best Products ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: darkColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //////////////////
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 74,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                          child: Image(image: AssetImage('assets/orange.png')),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rita-Orange Juice',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: darkColor),
                              ),
                              Text(
                                'Boisson',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ////////////////////////////////

                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 74,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Image(image: AssetImage('assets/orange.png')),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rita-Orange Juice',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: darkColor),
                              ),
                              Text(
                                'Boisson',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 74,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                          child: Image(image: AssetImage('assets/orange.png')),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rita-Orange Juice',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: darkColor),
                              ),
                              Text(
                                'Boisson',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
