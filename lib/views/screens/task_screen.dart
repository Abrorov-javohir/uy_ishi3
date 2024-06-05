import 'package:flutter/material.dart';
import 'package:uy_ishi/controller/task_controller.dart';
import 'package:uy_ishi/model/task.dart';

class Todoscreen extends StatefulWidget {
  const Todoscreen({super.key});

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  final TasksController taskController = TasksController();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> addTask() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskController,
                decoration: const InputDecoration(labelText: 'Task'),
              ),
              TextField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Date'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final String task = _taskController.text;
                final String date = _dateController.text;
                if (task.isNotEmpty && date.isNotEmpty) {
                  await taskController.addTask(task, date);
                  setState(() {});
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid task or date')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> editTask(Task task) async {
    _taskController.text = task.title;
    _dateController.text = task.date;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskController,
                decoration: const InputDecoration(labelText: 'Task'),
              ),
              TextField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Date'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final String taskTitle = _taskController.text;
                final String taskDate = _dateController.text;
                if (taskTitle.isNotEmpty && taskDate.isNotEmpty) {
                  await taskController.editTasks(
                      task.id, taskTitle, taskDate, task.isDone);
                  setState(() {});
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid task or date')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteTask(Task task) async {
    await taskController.isDelete(task.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide()),
        backgroundColor: Colors.red,
        onPressed: addTask,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined))
        ],
        title: const Text('Todo Screen'),
      ),
      body: FutureBuilder<List<Task>>(
        future: taskController.list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No tasks available. Add a task to get started!',
                style: TextStyle(fontSize: 23, color: Colors.red),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final task = snapshot.data![index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.date),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => editTask(task),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => deleteTask(task),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
