import 'package:flutter/material.dart';

class Noteswidget extends StatefulWidget {
  final note;
  final VoidCallback isEdit;
  final VoidCallback isDelete;
  Noteswidget(
      {super.key,
      required this.note,
      required this.isEdit,
      required this.isDelete});

  @override
  State<Noteswidget> createState() => _NoteswidgetState();
}

class _NoteswidgetState extends State<Noteswidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.note.title,
        ),
        subtitle: Text(widget.note.date),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: widget.isDelete,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: widget.isEdit,
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
