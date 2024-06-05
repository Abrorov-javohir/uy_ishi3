import 'package:flutter/material.dart';

class ContactAddDialog extends StatefulWidget {
  @override
  _ContactAddDialogState createState() => _ContactAddDialogState();
}

class _ContactAddDialogState extends State<ContactAddDialog> {
  final _nameController = TextEditingController();
  final _taskController = TextEditingController();
  bool _completed = false;
  bool _reminder = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: _taskController, decoration: InputDecoration(labelText: 'Task')),
          CheckboxListTile(
            title: Text('Completed'),
            value: _completed,
            onChanged: (value) {
              setState(() {
                _completed = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Reminder'),
            value: _reminder,
            onChanged: (value) {
              setState(() {
                _reminder = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop({
              'name': _nameController.text,
              'task': _taskController.text,
              'completed': _completed,
              'reminder': _reminder,
            });
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}