import 'package:flutter/material.dart';
import 'package:test_app_batch21/screens/widgets/task_widget.dart';

class TaskPage extends StatelessWidget {
  // List<String> _taskCategoryList = [
  //   'Business',
  //   'Business',
  //   'Business',
  //   'Business',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Colors.teal,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Task',
          style: TextStyle(
            color: Colors.teal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showTaskCategoryDialog(context);
            },
            icon: Icon(
              Icons.filter_list_outlined,
              color: Colors.teal,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TaskWidget();
        },
        itemCount: 10,
      ),
    );
  }
}

_showTaskCategoryDialog(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Task Category',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
          content: Container(
            height: 400,
            width: 300,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.teal,
                      ),
                      Text(
                        'Category',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Cancel Filter',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      });
}
