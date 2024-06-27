import 'package:app/widgets/Single_sector.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/models/sector.dart';
import 'package:flutter/rendering.dart';
import 'sector_update.dart';

class SearchSector extends StatefulWidget {
  const SearchSector({ Key? key, required this.secteurs}) : super(key: key);

 final  List<Sector> secteurs;

  @override
  State<SearchSector> createState() => _SearchSectorState();
}

class _SearchSectorState extends State<SearchSector> {

   String query = "";
  List<Sector> foundSectors = [];


  @override
  initState() {
    // at the beginning, all users are shown
    foundSectors = widget.secteurs;
    super.initState();
  }

 
   
  // Search Method
  void _searchSector(String enteredKeyword) {
    List<Sector> results = [];
    if (enteredKeyword.isEmpty) {
 
      results = widget.secteurs;
    } else {
      results = widget.secteurs
          .where((sector) =>
              sector.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
     setState(() {
      foundSectors = results;
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
            'Search Sector',
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
              title: Text('Sectors'),
            ),
            
               Container(
             margin: EdgeInsets.all(15),
              child: TextField(
              onChanged: (value){
                _searchSector(value);
                
                },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xffc2c2c2),
                        filled: true,
                      hintText: 'Enter Sector name',
                      suffixIcon: Icon(Icons.search),
                    ),  
              ),
            ),
            SizedBox(height: 20,),
           Expanded(
          child: foundSectors.isNotEmpty ? ListView.builder(
        shrinkWrap: true,
        itemCount: foundSectors.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
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
                          ' ${foundSectors[index].is_active == false ? 'Inactive' : 'Active'}',
                          style: foundSectors[index].is_active ==
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
                                '${foundSectors[index].name}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '${foundSectors[index].created_at}',
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
                                              builder: (context) =>
                                                  SectorUpdate(
                                                    name: foundSectors[index].name,
                                                    clients: foundSectors[index].clients,
                                                    cities:foundSectors[index].cities,
                                                    is_active: foundSectors[index].is_active,
                                                    created_at: foundSectors[index].created_at!,
                                                  )));
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
                                '${foundSectors[index].cities.length}',
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
                                '${foundSectors[index].clients.length}',
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
            ),
          );
        }
        ) : Center(child: Text('No results found')),
          ),
         
          ],
        ) 
         
         ),
    );
  }
}




