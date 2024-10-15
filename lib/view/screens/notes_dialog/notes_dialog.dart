import 'package:flutter/material.dart';

class NoteDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final Function(String title, String content) onSubmit;

  NoteDialog({this.title, this.content, required this.onSubmit});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = title ?? '';
    _contentController.text = content ?? '';

    return AlertDialog(
      title: Text(title == null ? 'Add Note' : 'Edit Note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _contentController,
            decoration: InputDecoration(labelText: 'Content'),
            maxLines: 4,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _contentController.text.isNotEmpty) {
              onSubmit(_titleController.text, _contentController.text);
              Navigator.of(context).pop(); // Close the dialog after submission
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
