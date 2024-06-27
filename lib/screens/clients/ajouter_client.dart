

import 'package:app/screens/clients/listes_des_clients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Clients_model.dart';
import '../../providers/Clients_provider.dart';

class AddClient extends StatefulWidget {
  
    static const routeName = '/ajouter_client';

  const AddClient({Key? key}) : super(key: key);

  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final _form = GlobalKey<FormState>();

  Client _client = Client(
    id: '',
    first_name: '',
    created_at: DateTime.now(),
    phone: '',
    city: '',
    money: '', email: '',
  );

  var _initValues = {
    ' first_name': '',
    'phone': '',
    'city': '',
    'money': '',
  };
 var _isInit = true;
@override
  void didChangeDependencies() {
    if (_isInit) {
      final clientId =  ModalRoute.of(context)!.settings.arguments as String;
       if (clientId != null) {
        _client  =  Provider.of<ClientsProvider>(context).findById(clientId);
        _initValues = {
           'first_name': _client.first_name,
           'phone': _client.phone,
        };
       }
    }
       _isInit = false;
    super.didChangeDependencies();
  }


  Future<void> _saveForm() async {
    _form.currentState!.save();

     if (_client.id!.isNotEmpty) {
       await Provider.of<ClientsProvider>(context, listen: false).updateClients(_client.id!, _client);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Client has been Updated!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay'),
                    ),
                  ],
                ));
     }else{
           try {
           await Provider.of<ClientsProvider>(context, listen: false)
          .addClients(_client);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Client has been Added!'),
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
  }

  @override
  Widget build(BuildContext context) {
    //var clients =  Provider.of<ClientsProvider>(context, listen: false);
    //clients.addClients(_clients);
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
          'Ajouter Client',
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
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: IconButton(
              onPressed: _saveForm,
              icon: Icon(Icons.check_rounded),
              color: Color(0xff2A3049),
              iconSize: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _form,
            child: Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(35.0, 15.0, 15.0, 10.0),
                child: Row(children: [
                  Text(
                    'Name',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                    ),
                  ),
                ]),
              ),

              Container(
                width: 340,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                    color: Color.fromRGBO(210, 215, 222, 1),
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  initialValue: _initValues['first_name'],
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Color(0xff6A7993),
                      ),
                      hintText: 'Enter username',
                      hintStyle: TextStyle(
                        color: Color(0xffD2D7DE),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provie a first name';
                    }
                    if (value.length < 4) {
                      return 'Should be at least 3 characters long.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _client = Client(
                      id: _client.id,
                        first_name: value!,
                        phone: _client.phone,
                        city: _client.city,
                        money: '', email: '');
                  },
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(35.0, 0.0, 15.0, 10.0),
                child: Row(children: [
                  Text(
                    'E-mail',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]),
              ),
              Container(
                width: 340,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                    color: Color.fromRGBO(210, 215, 222, 1),
                    width: 1,
                  ),
                ),
                child: TextFormField(
                    initialValue: _initValues['email'],
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Color(0xff6A7993),
                      ),
                      hintText: 'Enter e-mail adress',
                      hintStyle: TextStyle(
                        color: Color(0xffD2D7DE),
                      )),
                ),
              ),
              SizedBox(height: 20),

              ///////////////////////////////////////
              Container(
                padding: EdgeInsets.fromLTRB(35.0, 0.0, 15.0, 10.0),
                child: Row(children: [
                  Text(
                    'Phone',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                    ),
                  ),
                ]),
              ),
              Container(
                width: 340,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                    color: Color.fromRGBO(210, 215, 222, 1),
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  initialValue: _initValues['phone'],
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provie a first name';
                    }
                    if (value.length < 13) {
                      return 'Should be at least 13 characters long.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _client = Client(
                      id: _client.id,
                        first_name: _client.first_name,
                        phone: value!,
                        city: _client.city,
                        money: '', email: '');
                  },
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: Color(0xff6A7993),
                      ),
                      hintText: 'Enter Phone number',
                      hintStyle: TextStyle(
                        color: Color(0xffD2D7DE),
                      )),
                ),
              ),

              //////////////////////////////////////////////////
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(35.0, 0.0, 15.0, 10.0),
                child: Row(children: [
                  Text(
                    'Location',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]),
              ),
              Container(
                width: 340,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                    color: Color.fromRGBO(210, 215, 222, 1),
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  //    initialValue: _initValues['city'],
                  //      onSaved: (value){
                  //   _clients = Client(

                  //       first_name: _clients.first_name,
                  //       phone: _clients.phone,
                  //       city: value!,
                  //       money: null
                  //   );

                  // },
                  // onFieldSubmitted: (_){
                  //        _saveForm();
                  // },
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon: Icon(
                        Icons.map_outlined,
                        color: Color(0xff6A7993),
                      ),
                      hintText: 'Select location',
                      hintStyle: TextStyle(
                        color: Color(0xffD2D7DE),
                      )),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(35.0, 0.0, 15.0, 10.0),
                child: Row(children: [
                  Text(
                    'Catégorie',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(42, 48, 73, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]),
              ),
              Container(
                width: 340,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                    color: Color.fromRGBO(210, 215, 222, 1),
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon: Icon(
                        Icons.category_outlined,
                        color: Color(0xff6A7993),
                      ),
                      hintText: 'Selecet Catégorie',
                      hintStyle: TextStyle(
                        color: Color(0xffD2D7DE),
                      )),
                ),
              ),
            ])),
      ),
    ));
  }
}
