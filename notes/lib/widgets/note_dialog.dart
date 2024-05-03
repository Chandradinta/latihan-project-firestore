import 'dart:js_util';
import 'package:flutter/material.dart';

class NoteDialog extends StatelessWidget {
  final Map<String, dynamic>? note;
  final TextEditingController _tittleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  NoteDialog({super.key, this.note}) {
    if (note != null) {
      _tittleController.text = note!['title'];
      _descriptionController.text = note!['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(note == null ? 'add notes' : 'update notes'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'title',
            textAlign: TextAlign.start,
          ),
          TextField(
            controller: _tittleController,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'description',
              textAlign: TextAlign.start,
            ),
          ),
          TextField(
            controller: _descriptionController,
          ),
        ],
      ),
      actions: [Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(onPressed: (){Navigator.of(context).pop();
      },
      child: ,),)],
    );
  }
}
