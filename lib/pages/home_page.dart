import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
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
      body: _tasksList(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _tasksList() {
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
      onPressed: () {},
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
