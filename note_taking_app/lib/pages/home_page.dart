import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // create a new note
  void createNewNote() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          elevation: 0,
          backgroundColor: Colors.grey[300],
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.0, top: 75),
              child: Text(
                'Notes',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),

            // list of notes
            CupertinoListSection.insetGrouped(
              children: List.generate(
                value.getAllNotes().length,
                (index) => CupertinoListTile(
                    title: Text(value.getAllNotes()[index].text)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
