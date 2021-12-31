import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytodolist/screens/taskpage.dart';
import '../database_helper.dart';
import '../widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  DatabaseHelper _dbhelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container (
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 32.0,
                      bottom: 32.0,
                    ),
                    child: Image(
                      image: AssetImage(
                          'assets/images/logo.png'
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      initialData: [],
                      future: _dbhelper.getTasks(),
                      builder: (context,snapshot) {
                        return ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: ListView.builder(
                            itemCount: ((snapshot.data as dynamic).length),
                            itemBuilder: (context,index){
                              return GestureDetector(
                                onTap: (){

                                },
                                child: TaskCardWidget(
                                  //title: snapshot.data[index].title,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 10.0,
                right: 0.0,
                child: GestureDetector (
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskPage()),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF7349FE), Color(0xFF643FD8)],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0)
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add.png",
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