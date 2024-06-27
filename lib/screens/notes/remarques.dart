import 'package:flutter/material.dart';
import 'ajouter_remarque.dart';
import '/models/usernote_model.dart';
import 'package:provider/provider.dart';

class Remarque extends StatefulWidget {
  const Remarque({Key? key, required this.notes}) : super(key: key);

  final List<UserNote> notes;
  //final String? id;

  @override
  _RemarqueState createState() => _RemarqueState();
}

class _RemarqueState extends State<Remarque> {
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
            color: Colors.black,
          ),
          title: Text(
            'Remarques',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(42, 48, 73, 1),
              fontFamily: 'Nunito',
              fontSize: 20,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 60,
              // padding:EdgeInsets.fromLTRB(29.0, 2.0, 0.0,0.0),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remarques',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AjouterRem()),
                      );
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Color(0xff2A3049),
                    ),
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.notes.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 359,
                            height: 182.0006561279297,
                            margin: EdgeInsets.only(
                              left: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    'Mission title',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromRGBO(41, 48, 73, 1),
                                      fontFamily: 'Noto Sans',
                                      fontSize: 14,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${widget.notes[index].created_at}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromRGBO(194, 201, 215, 1),
                                      fontFamily: 'Noto Sans',
                                      fontSize: 14,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          AjouterRem.routeName,
                                          arguments: widget.notes[index].id);
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Color.fromRGBO(41, 48, 73, 1),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Color.fromRGBO(41, 48, 73, 1),
                                  thickness: 2,
                                  indent: 15,
                                  endIndent: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '${widget.notes[index].note}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromRGBO(90, 99, 132, 1),
                                        fontFamily: 'Noto Sans',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
