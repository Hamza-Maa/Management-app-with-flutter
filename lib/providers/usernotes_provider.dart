import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '/models/usernote_model.dart';
import '/Api/api.dart';
import 'package:provider/provider.dart';
import 'package:app/models/tracker_model.dart';
import 'package:http/http.dart' as http;

class UserNotesProvider with ChangeNotifier {
  List<UserNote> _notesList = [];

  Future<List<UserNote>> get_notes(
      {int page = 1, List<UserNote> previous_notes = const []}) async {
    String url = "dashboard/user_notes/";
    url += "?page=$page";
    try {
      final response = await Api.Get(url: url);
      var decodedJson = json.decode(response!.body);

      int user_notes_count = decodedJson["count"];
      List<UserNote> notes = [];
      for (var item in decodedJson["results"]) {
        notes.add(UserNote.fromMap(item));
      }
      List<UserNote> results = [...notes, ...previous_notes];

      _notesList = results;
      // print('the id of the note is : ${results[0].id}');
      notifyListeners();
      return _notesList;
    } catch (e) {
      print("error loading notes");
      print(e.toString());
      return [];
    }
  }

  List<UserNote> get noteList {
    return _notesList;
  }

  Future<void> addNotes(UserNote userNote) async {
    String url = "dashboard/user_notes/";
    try {
      final response = await Api.Post(
          url: url, body: {'note': userNote.note, 'id': userNote.id});
      final newNote = UserNote(
        id: userNote.id,
        display_id: userNote.display_id,
        note: userNote.note,
      );
      _notesList.insert(0, newNote);
      notifyListeners();
    } catch (e) {
      print("error loading notes");
      print(e.toString());
    }
  }

// To get the wanted ID 
  UserNote findById(String id) {
    return _notesList.firstWhere((temp) => temp.id == id);
  }


  Future<void> updateNotes(String id, UserNote newNote) async {
    final noteIndex = _notesList.indexWhere((usernote) => usernote.id == id);
    //print('id exist: $noteIndex');
    if (noteIndex >= 0) {
      final url = "dashboard/user_notes/$id/";
      await Api.Patch(
        url: url,
       body: {
        'note': newNote.note,
        'id': newNote.id,
      });

 
      _notesList[noteIndex] = newNote;
      notifyListeners();
    } else {
      print('...error Do something ');
    }
  }


}
