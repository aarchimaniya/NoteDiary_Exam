import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/likednotes_controller.dart';

class LikedNotesPage extends StatelessWidget {
  final LikedNotesController _controller = Get.put(LikedNotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liked Notes')),
      body: Obx(() {
        if (_controller.likedNotes.isEmpty) {
          return Center(child: Text('No liked notes.'));
        } else {
          return ListView.builder(
            itemCount: _controller.likedNotes.length,
            itemBuilder: (context, index) {
              final likedNote = _controller.likedNotes[index];
              return ListTile(
                title: Text(likedNote.title),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _controller.deleteLikedNote(likedNote);
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
