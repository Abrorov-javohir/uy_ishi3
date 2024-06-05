import 'package:flutter/material.dart';
import 'package:uy_ishi/controller/task_controller.dart';

class TasksController {
  List<Task> tasks = [
    // Dummy data for illustration. Replace with your data source.
    Task(
        id: 1,
        title: 'Task 1',
        date: '2023-12-01',
        isDone: true,
        hasReminder: true),
    Task(
        id: 2,
        title: 'Task 2',
        date: '2023-12-02',
        isDone: false,
        hasReminder: false),
    Task(
        id: 3,
        title: 'Task 3',
        date: '2023-12-03',
        isDone: true,
        hasReminder: true),
    Task(
        id: 4,
        title: 'Task 4',
        date: '2023-12-04',
        isDone: false,
        hasReminder: true),
  ];

  int countCompleted() {
    return tasks.where((task) => task.isDone).length;
  }

  int countUncompleted() {
    return tasks.where((task) => !task.isDone).length;
  }

  int countReminders() {
    return tasks.where((task) => task.hasReminder).length;
  }

  int countTotalTasks() {
    return tasks.length;
  }
}

class Task {
  final int id;
  final String title;
  final String date;
  final bool isDone;
  final bool hasReminder;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.isDone,
    required this.hasReminder,
  });
}

class StatisticsScreen extends StatelessWidget {
  final TasksController tasksController;

  StatisticsScreen({required this.tasksController});

  @override
  Widget build(BuildContext context) {
    final int completedTasks = tasksController.countCompleted();
    final int uncompletedTasks = tasksController.countUncompleted();
    final int reminders = tasksController.countReminders();
    final int totalTasks = tasksController.countTotalTasks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatisticsCard(
              title: 'Completed Tasks',
              count: completedTasks,
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            StatisticsCard(
              title: 'Uncompleted Tasks',
              count: uncompletedTasks,
              color: Colors.red,
            ),
            const SizedBox(height: 10),
            StatisticsCard(
              title: 'Reminders',
              count: reminders,
              color: Colors.blue,
            ),
            const SizedBox(height: 10),
            StatisticsCard(
              title: 'Total Tasks',
              count: totalTasks,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  const StatisticsCard({
    Key? key,
    required this.title,
    required this.count,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
            Text(
              '$count',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
