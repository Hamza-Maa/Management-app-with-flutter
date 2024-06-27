import 'dart:convert';

import 'package:app/models/sector.dart';
import 'package:flutter/cupertino.dart';

import '/models/usernote_model.dart';
import '/Api/api.dart';
import 'package:provider/provider.dart';
import 'package:app/models/city_model.dart';

class SectorsProvider with ChangeNotifier {
  List<Sector> _sectorsList = [];
  List<City> citiesList = [];
//  List<List<City>> secteurs = [];

  Future<List<Sector>> get_sectors() async {
    String url = "supervisor/sectors/";

    try {
      final response = await Api.Get(url: url);
      var decodedJson = json.decode(response!.body);

      List<Sector> sectors = [];
      for (var item in decodedJson["results"]) {
        sectors.add(Sector.fromMap(item));
      }
      List<Sector> results = sectors;
      _sectorsList = results;
      notifyListeners();
    
      return _sectorsList;
    } catch (e) {
      print("error loading notes");
      print(e.toString());
      return [];
    }
  }

  List<Sector> get sectorList {
    return _sectorsList;
  }

 Future<void> addSector(Sector sector) async {
    String url = "dashboard/sectors/sector";
    try {
      final response = await Api.Post(
        url: url, 
        body: {
        'name': sector.name,
      });
      final newSector = Sector(
        name: sector.name,
      display_id: sector.display_id,
      is_active: sector.is_active,
      sellerName: sector.sellerName, 
      cities: sector.cities,
      clients: sector.clients
      );
      _sectorsList.insert(0, newSector);
      notifyListeners();
    } catch (e) {
      print("error loading new sector");
      print(e.toString());
    }
  }




}