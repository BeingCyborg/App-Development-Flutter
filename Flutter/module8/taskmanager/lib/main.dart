import 'package:flutter/material.dart';

void main() => runApp(const TaskManagementApp());

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].description),
            onTap: () => _showTaskDetails(context, tasks[index]),
            onLongPress: () => _showBottomSheet(context, tasks[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? title;
        String? description;
        int? daysRequired;

        return AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) => description = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Days Required'),
                onChanged: (value) {
                  // Parse the daysRequired as an integer from the text input
                  daysRequired = int.tryParse(value);
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                // Add the new task to the task list
                if (title != null && description != null) {
                  setState(() {
                    tasks.add(Task(
                      title: title!,
                      description: description!,
                      daysRequired: daysRequired,
                    ));
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showTaskDetails(BuildContext context, Task task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(task.title),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Description: ${task.description}'),
                Text('Days Required: ${task.daysRequired ?? 'N/A'}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context, Task task) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          child: ListTile(
            title: const Text('Delete Task'),
            subtitle: const Text('Are you sure you want to delete this task?'),
            trailing: const Icon(Icons.delete),
            onTap: () {
              // Delete the task from the task list
              setState(() {
                tasks.remove(task);
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}

class Task {
  final String title;
  final String description;
  final int? daysRequired;

  Task({required this.title, required this.description, this.daysRequired});
}
