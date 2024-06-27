import 'dart:convert';
import 'tracker_model.dart';

class UserNote extends Tracker {
  int display_id;
  String note;
  // TODO add more attribute when api is ready

  // set setNote(String note) {
  //   this.note = note;
  // }

  UserNote(
      {String? id,
        DateTime? updated_at,
        DateTime? created_at,
        required this.display_id,
        required this.note})
      : super(id: id, created_at: created_at, updated_at: updated_at);

  static String get getRuntimeType {
    return UserNote(note: "", display_id: 0).runtimeType.toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'display_id': display_id,
      'note': note,
      'id': id,
      'created_at': Tracker.encode(super.created_at!),
      'updated_at': Tracker.encode(super.updated_at!),
    };
  }

  factory UserNote.fromMap(Map<String, dynamic> map) {
    return UserNote(
      created_at: Tracker.decode(map['created_at']),
      id: map['id'],
      updated_at: Tracker.decode(map['updated_at']),
      display_id: map['display_id'],
      note: map['note'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserNote.fromJson(String source) =>
      UserNote.fromMap(json.decode(source));
}