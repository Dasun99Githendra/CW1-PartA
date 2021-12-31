import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytodolist/models/task.dart';

import '../database_helper.dart';
import '../widgets.dart';

class TaskPage  extends StatefulWidget {

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24.0,
                        bottom: 12.0,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Image(
                                image: AssetImage (
                                    "assets/images/back_arrow.png"
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              onSubmitted: (value) async {
                                print("Field value: $value");

                                if (value != ""){
                                  DatabaseHelper _dbhelper = DatabaseHelper();

                                  Task _newtask = Task(
                                      title: value
                                  );

                                  await _dbhelper.insertTask(_newtask);
                                }

                              },
                              decoration: InputDecoration(
                                hintText: "Enter Task Title",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Enter description for the task...",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                            )
                        ),
                      ),
                    ),
                    Todowidget(
                      text: "Create your first task",
                      isDone: true,
                    ),
                    Todowidget(
                      text: "Create your first todo list",
                      isDone: true,
                    ),
                    Todowidget(
                      text: "Just another todo",
                      isDone: false,
                    ),
                    Todowidget(
                      isDone: false,
                    ),
                  ]
              ),
              Positioned(
                bottom: 10.0,
                right: 10.0,
                child: GestureDetector (
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskPage()
                      ),
                    );
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFE3577),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/delete.png",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
