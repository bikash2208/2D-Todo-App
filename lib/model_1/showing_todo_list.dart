import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/todo_1d_utils.dart';
import 'add_todo_task.dart';

final Color blue = Colors.blueAccent;
final Color white = Colors.white;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          autofocus: true,
          elevation: 25,
          backgroundColor: blue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTodoTask()));
          },
        ),
        backgroundColor: blue,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          title: Text(
            "Item List",
          ),
        ),
        body: Container(
          child: Consumer<AddTask>(builder: (context, pageItem, _) {
            return ListView.builder(
                itemCount: pageItem.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      pageItem.todoList[index].todoTitle,
                    ),
                  );
                });
          }),
        ));
  }
}
