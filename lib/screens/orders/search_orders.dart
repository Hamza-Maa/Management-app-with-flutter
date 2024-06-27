import 'package:flutter/material.dart';
import 'package:app/models/Orders_model.dart';
import 'package:app/constants.dart';
import 'order_history_detail.dart';

class SearchCommand extends StatefulWidget {
  const SearchCommand({ Key? key, required this.orders }) : super(key: key);

  final List<Order> orders;

  @override
  State<SearchCommand> createState() => _SearchCommandState();
}

class _SearchCommandState extends State<SearchCommand> {

   String query = "";
  List<Order> foundOrders = [];


  @override
  initState() {
    // at the beginning, all users are shown
    foundOrders = widget.orders;
    super.initState();
  }

 
   
  // Search Method
  void _searchOrder(String enteredKeyword) {
    List<Order> results = [];
    if (enteredKeyword.isEmpty) {
 
      results = widget.orders;
    } else {
      results = widget.orders.where((order) =>
              order.client!.first_name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
     setState(() {
      foundOrders = results;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
      backgroundColor: scafoldColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Search Order',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(42, 48, 73, 1),
              fontSize: 20,
            ),
          ),
         
        ),
        body: Column(
          children: [
            ListTile(
              title: Text('Orders'),
            ),
               Container(
             margin: EdgeInsets.all(15),
              child: TextField(
              onChanged: (value){_searchOrder(value);},
            
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xffc2c2c2),
                        filled: true,
                      hintText: 'Enter Order name',
                      suffixIcon: Icon(Icons.search),
                    ),  
              ),
            ),
             SizedBox(height: 20,),
               Expanded(
                 child: foundOrders.isNotEmpty ?    ListView.builder(
                   itemCount: foundOrders.length,
                   itemBuilder: ((context, index) {
                 return Column(
        children: [ 
          InkWell(
            onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => orderdetail(
          created: foundOrders[index].created_at,
          id: foundOrders[index].id!,
        )));
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10.0, 5.0),
          margin: EdgeInsets.only(top: 10, bottom: 10),
          width: 351,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 1),
                  blurRadius: 4)
            ],
            color: Color.fromRGBO(247, 249, 253, 1),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Color.fromRGBO(41, 48, 73, 1),
                        size: 20,
                      ),
                      Text(
                        '${foundOrders[index].client!.first_name}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(97, 109, 126, 1),
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${foundOrders[index].status}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffE7606B),
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '22 Orders',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(41, 48, 73, 1),
                          fontFamily: 'Nunito',
                          fontSize: 11,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${foundOrders[index].total_price}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(41, 48, 73, 1),
                          fontFamily: 'Nunito',
                          fontSize: 20,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Unit',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xffBAC3D5),
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
          ),
          ],
      );
               })): Center(child: Text('No results found')),)
          ],
        ),
    ));
  }
}