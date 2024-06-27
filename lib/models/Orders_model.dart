import 'dart:convert';
import 'package:app/models/tracker_model.dart';
import 'package:app/models/Clients_model.dart';


class Order extends Tracker{
 dynamic   status;
 dynamic  total_price;
 Client? client;

 Order({
  String? id,
  DateTime? updated_at,
  DateTime? created_at,
  required this.status,
  required this.total_price,
  this.client,

 }): super(id: id, created_at: created_at, updated_at: updated_at);
 static String get getRuntimeType {
  return Order(status: 0, total_price: null, )
      .runtimeType
      .toString();
 }
//  Map<String, dynamic> toMap() {
//   return {
//    'total_price': total_price,
//    'status': status,
//    'id': id,
//    'created_at': Tracker.encode(super.created_at!),
//    'updated_at': Tracker.encode(super.updated_at!),
  

//   };
//  }
 factory Order.fromMap(Map<String, dynamic> map) {
  return Order(
   created_at: Tracker.decode(map['created_at']),
   id: map['id'],
   updated_at: Tracker.decode(map['updated_at']),
   total_price: map['total_price'],
   status: map['status'],
   client: Client.fromMap(map['client'])


  );
 }
 String toJson() => json.encode(toMap());

 factory Order.fromJson(String source) => Order.fromMap(json.decode(source));


}