import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;

  String? _newTaskContent;
  Box? _box;

  _HomePageState();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    print("input new task content : $_newTaskContent");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.15,
        backgroundColor: Colors.red,
        title: const Text(
          'Taskly!',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
      ),
      body: _tasksView(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _tasksView() {
    return FutureBuilder(
        future: Hive.openBox('tasks'),
        // future: Future.delayed(const Duration(seconds: 2)),
        builder: (BuildContext _context, AsyncSnapshot _snapshot) {
          if (_snapshot.connectionState == ConnectionState.done) {
            _box = _snapshot.data;
            return _tasksList();
          } else {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _tasksList() {
    Task _newTask =
        Task(content: 'Go to Gym', timestamp: DateTime.now(), done: false);
    _box?.add(
      _newTask.toMap(),
    );
    return ListView(
      children: [
        ListTile(
          title: const Text(
            'Do Laundry!',
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          subtitle: Text(
            DateTime.now().toString(),
          ),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Colors.red,
          ),
          // onTap: () {},
        ),
        ListTile(
          title: const Text(
            'Do Laundry!',
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          subtitle: Text(
            DateTime.now().toString(),
          ),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Colors.red,
          ),
          // onTap: () {},
        ),
      ],
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: _displayTaskPopup,
      child: const Icon(
        Icons.add,
      ),
    );
  }

  void _displayTaskPopup() {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            onSubmitted: (_value) {},
            onChanged: (_value) {
              setState(() {
                _newTaskContent = _value;
              });
            },
          ),
        );
      },
    );
  }
}
