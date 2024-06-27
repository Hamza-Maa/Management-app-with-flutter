import 'dart:convert';
import 'package:app/models/Clients_model.dart';

import '/models/tracker_model.dart';
import 'city_model.dart';

class Sector extends Tracker {
  int display_id;
  String name;
  String sellerName;
  bool is_active;
 final List<City> cities;
 final List<Client> clients;

  Sector({
    String? id,
    DateTime? updated_at,
    DateTime? created_at,
    required this.display_id,
    required this.name,
    required this.sellerName,
    required this.is_active,
    required this.cities,
    required this.clients,
  }) : super(id: id, created_at: created_at, updated_at: updated_at);

  static String get getRuntimeType {
    return Sector(name: "", display_id: 0, sellerName: "", is_active: false, cities: [], clients: [])
        .runtimeType
        .toString();
  }

  factory Sector.fromMap(Map<String, dynamic> map) {
    return Sector(
        created_at: Tracker.decode(map['created_at']),
        id: map['id'],
        updated_at: Tracker.decode(map['updated_at']),
        display_id: map['display_id'],
        name: map['name'],
        sellerName: map['sellerName'],
        is_active: map['is_active'], 
        cities: (map['cities'] as List<dynamic>).map((e) => City.fromMap(e as Map<String, dynamic>)).toList(),
        clients: (map['clients'] as List<dynamic>).map((e) => Client.fromMap(e as Map<String, dynamic>)).toList(),
        );
        
  }
  //  String toJson() => json.encode(toMap());

  // factory Sector.fromJson(dynamic source) =>
  //     Sector.fromMap(json.decode(source));
}
