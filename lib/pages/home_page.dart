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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _tasksList() {
    return Container(
      width: _deviceWidth * 0.9,
      height: _deviceHeight * 0.7,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Task $index'),
            onTap: () {
              // Navigate to the TaskDetailsPage with the task index
            },
          );
        },
      ),
    );
  }
}
