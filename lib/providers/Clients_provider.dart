import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../Api/api.dart';
import '../models/Clients_model.dart';

import 'package:provider/provider.dart';

class ClientsProvider with ChangeNotifier {
  List<Client> _clientsList = [];

  Future<List<Client>> get_clients(
      {int page = 1, List<Client> previous_Firstname = const []}) async {
    String url = "supervisor/clients/";
    url += "?page=$page";
    try {
      final response = await Api.Get(url: url);
      var decodedJson = json.decode(response!.body);

      int first_name_count = decodedJson["count"];
      List<Client> Clients = [];
      for (var item in decodedJson["results"]) {
        Clients.add(Client.fromMap(item));
      }
      List<Client> results = Clients;

      _clientsList = results;
      // notifyListeners();
      return _clientsList;
    } catch (e) {
      print("error loading clients");
      print(e.toString());
      return [];
    }
  }

  List<Client> get clientList {
    return _clientsList;
  }

  Future<void> addClients(Client clients) async {
    String url = "supervisor/clients/";
    try {
      final response = await Api.Post(url: url, body: {
        'first_name': clients.first_name,
        'phone': clients.phone,
        // 'city': clients.city,
      });
    

      final newClient = Client(
        first_name: clients.first_name,
        city: clients.city,
        phone: clients.phone,
        money: null, email: '',
      );
      _clientsList.insert(0, newClient);
      notifyListeners();
    } catch (e) {
      print("error loading new client");
      print(e.toString());
    }
  }



  Client findById(String id) {
    return _clientsList.firstWhere((prod) => prod.id == id);
  }

  Future<void> updateClients(String id, Client client) async {
    final clientIndex = _clientsList.indexWhere((cli) => cli.id == id);
    print('id exist: $clientIndex');
    if (clientIndex >= 0) {
      final url = "supervisor/clients/$id/";
      await Api.Patch(
        url: url,
       body: {
        'first_name': client.first_name,
        'id': client.id,
      });
      _clientsList[clientIndex] = client;
      notifyListeners();
    } else {
      print('...error Do something ');
    }
  }



}
