import 'dart:convert';
import 'package:app/models/tracker_model.dart';

class Client extends Tracker {
  String first_name;
  String phone;
  String city;
  dynamic money;
  String  email;

  Client({
    String? id,
    DateTime? updated_at,
    DateTime? created_at,
    required this.first_name,
    required this.phone,
    required this.city,
    required this.money,
    required this.email,
  }) : super(id: id, created_at: created_at, updated_at: updated_at);

  static String get getRuntimeType {
    return Client(first_name: "", phone: "", city: "", money: 0, email: '')
        .runtimeType
        .toString();
  }

  Map<String, dynamic> toMap() {
    return {
      ' money': money,
      'city': city,
      'phone': phone,
      'email':email,
      'first_name': first_name,
      'id': id,
      'created_at': Tracker.encode(super.created_at!),
      'updated_at': Tracker.encode(super.updated_at!),

    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
        created_at: Tracker.decode(map['created_at']),
        id: map['id'],
        updated_at: Tracker.decode(map['updated_at']),
        first_name: map['first_name'],
        phone: map['phone'],
        city: map['city'],
        money: map['money'],
        email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));
}
