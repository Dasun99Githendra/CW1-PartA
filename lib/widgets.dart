import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final title;
  final desc;
  TaskCardWidget({this.title,this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 24.0,
        ),
        margin: EdgeInsets.only(
          bottom: 20.0,
        ),
        color: Colors.white,
        //decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(20.0)
        //),
        child: Column(
          children: [
            Text(
              title ?? "(Unnamed Task)",
              style: TextStyle(
                color: Color(0xFF211551),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top:15.0,
              ),
              child: Text(
                  desc ?? "No discription Added",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF86829D),
                    height: 1.5,
                  )
              ),
            )
          ],
        )
    );
  }
}

class Todowidget extends StatelessWidget {
  final text;
  final isDone;
  Todowidget({this.text,@required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(
              right: 12.0,
            ),
            decoration: BoxDecoration(
                color: isDone ? Color(0xFF7349FE): Colors.transparent,
                borderRadius: BorderRadius.circular(5.0),
                border: isDone ? null : Border.all(
                  color: Color(0xFF868290),
                  width: 1.5,
                )
            ),
            child: Image(
              image: AssetImage(
                  "assets/images/check.png"
              ),
            ),
          ),
          Text(
            text ?? "Unnamed Todo",
            style: TextStyle(
              color: isDone ? Color(0xFF211551) : Color(0xFF868290),
              fontSize: 16.0,
              fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
            ),),
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
