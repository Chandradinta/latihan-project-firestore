import 'dart:io' as io;
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notesnew/models/note.dart';
import 'package:path/path.dart' as path;

class NoteService {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static final CollectionReference _notesCollection =
      _database.collection('notes');
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<String?> uploadImage(X509Certificate file) async {
    try {
      String fileName = path.basename(file.path);
      Reference ref = _storage.ref().child('images').child('/${fileName}');
      UploadTask uploadTask;

      if (kIsWeb) {
        uploadTask = ref.putData(await file.readAsBytes());
      } else {
        uploadTask = ref.putFile(io.File(file.path));
      }

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      return null;
    }
  }

  static Future<void> addNote(Note note) async {
    Map<String, dynamic> newNote = {
      'title': note.title,
      'description': note.description,
      'image_url': note.imageUrl,
      'created_at': FieldValue.serverTimestamp(),
      'updated_at': FieldValue.serverTimestamp(),
    };
    await _notesCollection.add(newNote);
  }

  static Future<void> updateNote(Note note) async {
    Map<String, dynamic> updatedNote = {
      'title': note.title,
      'description': note.description,
      'image_url': note.imageUrl,
      'created_at': note.createdAt,
      'updated_at': FieldValue.serverTimestamp(),
    };

    await _notesCollection.doc(note.id).update(updatedNote);
  }

  static Future<void> deleteNote(Note note) async {
    await _notesCollection.doc(note.id).delete();
  }

  static Future<QuerySnapshot> retrieveNotes() async {
    return _notesCollection.get();
  }

  static Stream<List<Note>> getNoteList() {
    return _notesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Note(
          id: doc.id,
          title: data['title'],
          description: data['description'],
          imageUrl: data['image_url'],
          createdAt: data['created_at'] != null
              ? data['created_at'] as Timestamp
              : null,
          updatedAt: data['updated_at'] != null
              ? data['updated_at'] as Timestamp
              : null,
        );
      }).toList();
    });
  }
}