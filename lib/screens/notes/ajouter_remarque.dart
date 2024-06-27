import 'package:app/providers/usernotes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/usernote_model.dart';

class AjouterRem extends StatefulWidget {

  static const routeName = '/ajouter_remarque';

  const AjouterRem({Key? key}) : super(key: key);

  @override
  _AjouterRemState createState() => _AjouterRemState();
}

class _AjouterRemState extends State<AjouterRem> {
  final _form = GlobalKey<FormState>();

  UserNote _userNote = UserNote(
    id: '',
    note: '',
    display_id: 0,
  );

  var _initValues = {
    'note': '',
   };

  var _isInit = true;
    var _isLoading = false;



  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      final userNoteId = ModalRoute.of(context)!.settings.arguments as String;
      
      if (userNoteId != null) {
        _userNote = Provider.of<UserNotesProvider>(context, listen: false)
            .findById(userNoteId);
      _initValues = {'note': _userNote.note};
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }





  Future<void> _saveForm() async {
    _form.currentState!.save();
      //   setState(() {
	    //   _isLoading = true;
	    // });
    if (_userNote.id!.isNotEmpty) {
      await Provider.of<UserNotesProvider>(context, listen: false)
          .updateNotes(_userNote.id!, _userNote);
           showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Note has been Updated!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay'),
                    ),
                  ],
                ));
    } else {
      try {
        await Provider.of<UserNotesProvider>(context, listen: false)
            .addNotes(_userNote);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Note has been Added!'),
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
                  title: Text('An error occured!'),
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
       setState(() {
	      _isLoading = false;
	    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<UserNotesProvider>(context).addNotes(_userNote);
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
          "Ajouter Une remarque",
          style: TextStyle(
            color: Color.fromRGBO(41, 48, 73, 1),
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(onPressed: _saveForm, icon: Icon(Icons.check_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _form,
            child: Column(children: [
             
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(33.0, 2.0, 20.0, 20.0),
                child: Row(children: [
                  Text(
                    'Description',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 18,
                    ),
                  ),
                ]),
              ),
              Container(
                width: 380,
                height: 240,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                    color: Color.fromRGBO(210, 215, 222, 1),
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  initialValue: _initValues['note'],
                  maxLines: 3,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Ecrire ici',
                      hintStyle: TextStyle(
                        color: Color(0xffD2D7DE),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a description!';
                    }
                    if (value.length < 10) {
                      return 'Should be at least 10 characters long.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userNote = UserNote(
                        id: _userNote.id,
                        display_id: _userNote.display_id,
                        note: value!);
                  },
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/Alert.png'),
                  ),
                ),
              )
            ])),
      ),
    ));
  }
}
