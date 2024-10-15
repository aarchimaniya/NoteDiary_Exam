import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Get.toNamed('/liked');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (_controller.notes.isEmpty) {
          return Center(child: Text('No notes available.'));
        } else {
          return ListView.builder(
            itemCount: _controller.notes.length,
            itemBuilder: (context, index) {
              final note = _controller.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                onTap: () {
                  _controller.editNoteDialog(note);
                },
                trailing: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    _controller.likeNote(note);
                  },
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.addNoteDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
