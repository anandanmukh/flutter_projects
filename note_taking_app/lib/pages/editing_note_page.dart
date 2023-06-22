import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../models/note_data.dart';

// ignore: must_be_immutable
class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;
  EditingNotePage({super.key, required this.note, required this.isNewNote});

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    loadExistingNote();
  }

  // load existing nore
  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  // adding a new note
  void addNewNote(int id) {
    // get text from the editor
    String text = _controller.document.toPlainText();

    // add the new note
    Provider.of<Note>(context, listen: false).addNewNote(
      Note(id: id, text: text),
    );
  }

  // update existing note
  void updateNote() {
    // get text from editor
    String text = _controller.document.toPlainText();
    // update note
    Provider.of<NoteData>(context, listen: false).updateNote(widget.note, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // toolbar
          QuillToolbar.basic(
            controller: _controller,
          ),

          // editor
          Expanded(
            child: Container(
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
