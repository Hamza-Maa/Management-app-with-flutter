import 'package:app/login/login_screen.dart';
import 'package:app/providers/Clients_provider.dart';
import 'package:app/providers/Orders_provider.dart';
import 'package:app/screens/clients/ajouter_client.dart';
import 'package:app/screens/clients/listes_des_clients.dart';

import '/providers/sectors_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '/providers/usernotes_provider.dart';
import '/screens/home/home_screen.dart';
import 'screens/notes/ajouter_remarque.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotesProvider>(
            create: (context) => UserNotesProvider()),
        ChangeNotifierProvider<SectorsProvider>(
            create: (context) => SectorsProvider()),
        ChangeNotifierProvider<ClientsProvider>(
            create: (context) => ClientsProvider()),
        ChangeNotifierProvider<OrdersProviders>(
            create: (context) => OrdersProviders()),
      ],
      child: MaterialApp(
        home: loginScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          AjouterRem.routeName: (context) => AjouterRem(),
          AddClient.routeName: (context) => AddClient(),
         
        },
      ),
    );
  }
}