import 'package:intl/intl.dart';

import '../services/uuid.dart';

class Tracker {
  //@primaryKey
  String? id;
  DateTime? created_at;
  DateTime? updated_at;

  Tracker({
    this.id,
    this.created_at,
    this.updated_at,
  }) {
    id = id ?? uuid_gen();
    created_at = created_at ?? decode(encode(DateTime.now()));
    updated_at = updated_at ?? decode(encode(DateTime.now()));
  }
  static String encode(DateTime date) {
    return DateFormat('yyyy-MM-ddThh:mm:ss.S').format(date);
  }

  static DateTime? decode(String? date) {
    return date == null ? null : DateTime.parse(date);
  }

  void on_update() {
    updated_at = decode(encode(DateTime.now()));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': created_at?.millisecondsSinceEpoch,
      'updated_at': updated_at?.millisecondsSinceEpoch,
    };
  }
}
