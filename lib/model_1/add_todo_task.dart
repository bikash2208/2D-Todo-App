import '../utils/todo_1d_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Color blue = Colors.blueAccent;
final Color white = Colors.white;

class AddTodoTask extends StatefulWidget {
  AddTodoTask() : super();

  @override
  _AddTodoTaskState createState() => _AddTodoTaskState();
}

TextEditingController itemText = TextEditingController();

class _AddTodoTaskState extends State<AddTodoTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        backgroundColor: blue,
        elevation: 0,
        title: Text("Add Item"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white60,
              ),
              height: 50,
              child: TextFormField(
                controller: itemText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                ),
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  filled: true,
                  // border: UnderlineInputBorder(),
                  hintText: "Add item...",
                  hintStyle: TextStyle(fontSize: 20),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2.0,
              child: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(blue),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  backgroundColor: MaterialStateProperty.all(blue),
                  elevation: MaterialStateProperty.all(5),
                ),
                onPressed: () async {
                  if (itemText.text.isEmpty) {
                    Navigator.pop(context);
                    return;
                  }
                  String _text = itemText.text;
                  itemText.clear();
                  await Provider.of<AddTask>(context, listen: false)
                      .addTask(_text);
                  Navigator.pop(context);

                  print("clicked");
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
