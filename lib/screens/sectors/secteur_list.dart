import 'package:app/constants.dart';
import 'package:app/models/sector.dart';
import 'package:app/providers/sectors_provider.dart';
import 'package:app/screens/sectors/search_sector.dart';
import 'package:app/screens/sectors/sector_update.dart';
import '/widgets/Single_sector.dart';
import '/widgets/sector_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Secteurs Screen
enum Sectors { Tous_les_secteurs, active, inactive }

class Secteurs extends StatefulWidget {
 
   
 final  List<Sector> sectors;

 Secteurs({required this.sectors});

  @override
  State<Secteurs> createState() => _SecteursState();
}

class _SecteursState extends State<Secteurs> {
  Sectors _sectors = Sectors.Tous_les_secteurs;
    String state_of_sector = 'Toutes';
    bool is_searching = false;
    //String query = "";
   final _form = GlobalKey<FormState>();
    Sector _sector = Sector(
      display_id: 0, 
      name: '', 
      sellerName: '', 
      is_active: false,
      cities: [],
      clients: [],
      );
  
  //  searchSector(String query){

  //  List<Sector> _searchSector = widget.sectors.where((element){
  //    return element.name.toLowerCase().contains(query);
  //  }).toList();
  // return _searchSector;
  // }

  Future<void> _saveForm() async {
    _form.currentState!.save();

    print(_sector.name);
    try {
      await Provider.of<SectorsProvider>(context, listen: false).addSector(_sector);
          
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Sector has been Added!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Okay'),
                  ),
                ],
              ));
    } catch (error) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('Something went wrong'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Okay'),
                  ),
                ],
              ));
    }
   
  }
  @override
  Widget build(BuildContext context) {
    var sectorsProvider = Provider.of<SectorsProvider>(context);
    sectorsProvider.get_sectors();
 //   List<Sector> _searchItem = searchSector(query);
   
  
           List<Sector> active_sector = [];
           List<Sector> inactive_sector = [];

     if (state_of_sector == "Active") {
      
         sectorsProvider.sectorList.forEach((element) {

          if (element.is_active) {
              active_sector.add(element);
     
          };
         });
   
     }
  if (state_of_sector == "Inactive") {
      
         sectorsProvider.sectorList.forEach((element) {

          if (!element.is_active) {
              inactive_sector.add(element);
              
          
          };
   
         });
     
     }
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
          title:  Text(
            "Secteurs",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          // ) :Container(
          //   height: 40,
          //   child: TextField(
          //         onChanged: (value){
          //           setState(() {
          //                 query = value;
          //                 print(query);
          //           });
          //         },
          //             decoration: InputDecoration(
          //               contentPadding: EdgeInsets.only(top: 14),
          //                 border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(10),
          //                   borderSide: BorderSide.none,
                              
          //                 ),
          //                 fillColor: Color.fromARGB(255, 234, 231, 231),
          //                 filled: true,
          //               hintText: 'Enter sector name',
          //               prefixIcon: Icon(Icons.search),
          //             ),  
          //       ),
          // ),
          actions: [
            IconButton(
                onPressed: () {
                  //Do something
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchSector(secteurs: widget.sectors,)));
                },
                icon: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          'Listes Des Secteurs',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Sector Filters Container in Widgets
              Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 15,
      ),
      padding: EdgeInsets.only(right: 10),
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //tous les secteurs
            Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Radio(
                    value: Sectors.Tous_les_secteurs,
                    groupValue: _sectors,
                    onChanged: (Sectors? value) {
                      state_of_sector = 'Toutes';
                      setState(() {
                        _sectors = value!;
                  
                      });
                    },
                    fillColor:
                        MaterialStateColor.resolveWith((states) => darkColor),
                  ),
                ),
                Text(
                  'Tous les secteurs',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            /////////
            //Active Sector
            Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Radio(
                    value: Sectors.active,
                    groupValue: _sectors,
                    onChanged: (Sectors? value) {
                        state_of_sector = 'Active';
                      setState(() {
                        _sectors = value!;
                      
                      });
                    },
                    fillColor:
                        MaterialStateColor.resolveWith((states) => darkColor),
                  ),
                ),
                Text(
                  'Active',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            ////////////
            //Inactive Sector
            Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Radio(
                    value: Sectors.inactive,
                    groupValue: _sectors,
                    onChanged: (Sectors? value) {
                         state_of_sector = 'Inactive';
                      setState(() {
                        _sectors = value!;
                   
                      });
                    },
                    fillColor:
                        MaterialStateColor.resolveWith((states) => darkColor),
                  ),
                ),
                Text(
                  'Inactive',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            ////////////
          ],
        ),
      ),
    ),
                ],
              ),
            ),
            //Siglee Sector from widgets
            
            Expanded(
               
      child:  state_of_sector == "Active" ?  ListView.builder (
        shrinkWrap: true,
        itemCount: active_sector.length ,
        itemBuilder: (ctx, index) {
        
          if (active_sector.isNotEmpty) {
            return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child:  Row(
              children: [
                Container(
                  height: 225,
                  width: 400,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 6, right: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${active_sector[index].is_active == false ? 'Inactive' : 'Active'}',
                          style: active_sector[index].is_active ==
                                  false
                              ? TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: deleteColor)
                              : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: greenDarkColor,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '${active_sector[index].name}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '${active_sector[index].created_at}',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                              ),
                            ],
                          ),
                          //Edit and Delete Buttons Row
                          Row(
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => SectorUpdate(
                                                   name: active_sector[index].name,
                                                clients: active_sector[index].clients,
                                                 cities: active_sector[index].cities, 
                                                 is_active: active_sector[index].is_active,
                                                 created_at: active_sector[index].created_at!,
                                                 )
                                                 ));
                                     },
                                    icon: Icon(
                                      Icons.edit_note_outlined,
                                      size: 35,
                                      color: orangeColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                  
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 35,
                                      color: deleteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'N.viles',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${active_sector[index].cities.length}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: greenDarkColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                              height: 80,
                              child: VerticalDivider(color: Colors.grey)),
                          Column(
                            children: [
                              Text(
                                'N.clients',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${active_sector[index].clients.length}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: greenDarkColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                              height: 80,
                              child: VerticalDivider(color: Colors.grey)),
                          Column(
                            children: [
                              Text(
                                'Vendeur',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '-',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: greenDarkColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ) ,
            );
            
          }else{
            print('No data');
          return  Container(child: Text('Test'),);
          }

        }
        ) : state_of_sector == "Inactive" ? ListView.builder (
        shrinkWrap: true,
        itemCount: inactive_sector.length ,
        itemBuilder: (ctx, index) {
        
          if (inactive_sector.isNotEmpty) {
            return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child:  Row(
              children: [
                Container(
                  height: 225,
                  width: 400,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 6, right: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${inactive_sector[index].is_active == false ? 'Inactive' : 'Active'}',
                          style: inactive_sector[index].is_active ==
                                  false
                              ? TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: deleteColor)
                              : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: greenDarkColor,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '${inactive_sector[index].name}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '${inactive_sector[index].created_at}',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                              ),
                            ],
                          ),
                          //Edit and Delete Buttons Row
                          Row(
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => SectorUpdate(
                                                   name: inactive_sector[index].name,
                                                clients: inactive_sector[index].clients,
                                                 cities: inactive_sector[index].cities, 
                                                 is_active: inactive_sector[index].is_active,
                                                 created_at: inactive_sector[index].created_at!,
                                                 )
                                                 ));
                                     },
                                    icon: Icon(
                                      Icons.edit_note_outlined,
                                      size: 35,
                                      color: orangeColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                  
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 35,
                                      color: deleteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'N.viles',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${inactive_sector[index].cities.length}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: greenDarkColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                              height: 80,
                              child: VerticalDivider(color: Colors.grey)),
                          Column(
                            children: [
                              Text(
                                'N.clients',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${inactive_sector[index].clients.length}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: greenDarkColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                              height: 80,
                              child: VerticalDivider(color: Colors.grey)),
                          Column(
                            children: [
                              Text(
                                'Vendeur',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '-',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: greenDarkColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ) ,
            );
            
          }else{
            print('No data');
          return  Container(child: Text('Test'),);
          }

        }
        ) :  SingleSector(),
            
      ),
        //  Column(
        //       children: _searchItem.map((data){
        //                  return  Sector(
        //                     name: data.name, 
        //                       display_id: data.display_id,
        //                       sellerName: data.sellerName,
        //                       is_active: data.is_active,
        //                       cities: data.cities,
        //                       clients: data.clients,
        //           );
        //       }).toList();
        //     ),



            SizedBox(
              height: 15,
            ),

///////////////////////////////

            Container(
              padding: EdgeInsets.only(top: 5, right: 20, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Add Button
                  FloatingActionButton(
                    backgroundColor: sunnyColor,
                    child: Icon(
                      Icons.add,
                      size: 35,
                    ),
                    onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: 250,
                          width: 200,
                          padding: EdgeInsets.all(35),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(30),
                              topRight: const Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                    Form(
                       key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nom du secteur',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xffF6F8F9),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            child: TextFormField(
               validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provie a first name';
                    }
                    if (value.length < 4) {
                      return 'Should be at least 3 characters long.';
                    }
                    return null;
                  },
              onSaved: (value){
                   _sector = Sector(
                     display_id: _sector.display_id,
                      name: value!, 
                      sellerName: _sector.sellerName,
                      is_active: _sector.is_active, 
                      cities: [],
                      clients: [],
                      );
              },
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: 'Entrer le nom du secteur',
                  hintStyle: TextStyle(color: Colors.black54)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ///////
          ElevatedButton(
            onPressed: _saveForm,
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              primary: orangeColor,
              fixedSize: Size(350, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ///////////////////
          ],
        ),
      ),
    );
  }
//Name TextField in ShowbottomSheet


  
}
