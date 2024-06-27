import 'dart:convert';
import '/models/tracker_model.dart';

class City extends Tracker {
  int display_id;
  String name;

  City({
    String? id,
    DateTime? updated_at,
    DateTime? created_at,
    required this.display_id,
    required this.name,
  }) : super(id: id, created_at: created_at, updated_at: updated_at);

  static String get getRuntimeType {
    return City(
      name: "",
      display_id: 0,
    ).runtimeType.toString();
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      created_at: Tracker.decode(map['created_at']),
      id: map['id'],
      updated_at: Tracker.decode(map['updated_at']),
      display_id: map['display_id'],
      name: map['name'],
    );
  }
}
