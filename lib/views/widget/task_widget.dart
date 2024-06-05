import 'package:flutter/material.dart';
import 'package:uy_ishi/controller/task_controller.dart';

class Taskswidget extends StatefulWidget {
  final task;
  final VoidCallback isEdit;
  final VoidCallback isDelete;

  const Taskswidget({
    super.key,
    required this.task,
    required this.isEdit,
    required this.isDelete,
  });

  @override
  State<Taskswidget> createState() => _TaskswidgetState();
}

class _TaskswidgetState extends State<Taskswidget> {
  final TasksController taskController = TasksController();

  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.title),
      subtitle: Text(
        widget.task.date,
        style: const TextStyle(color: Colors.red),
      ),
      leading: GestureDetector(
        onTap: () {
          setState(() {
            isChanged = !isChanged;
          });
        },
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isChanged ? Colors.green : Colors.white,
          ),
          child: isChanged
              ? const Icon(
                  Icons.done_all_outlined,
                  size: 20,
                  color: Colors.white,
                )
              : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: widget.isEdit,
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: widget.isDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
