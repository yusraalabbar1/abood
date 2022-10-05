import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //scrollDirection: Axis.horizontal,
      //reverse: true,

      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      // physics: BouncingScrollPhysics(),
      // physics: NeverScrollableScrollPhysics(),
      children: [
        Text("cars"),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              child: Text('1'),
              color: Colors.green[300],
              height: 200,
              width: 200,
            ),
            Container(
              child: Text('1'),
              color: Colors.green[400],
              height: 200,
              width: 200,
            )
          ],
        ),
        Text("mobile"),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              child: Text('1'),
              color: Colors.blue[500],
              height: 200,
              width: 200,
            ),
            Container(
              child: Text('1'),
              color: Colors.blue[400],
              height: 200,
              width: 200,
            ),
            Container(
              child: Text('1'),
              color: Colors.blue[300],
              height: 200,
              width: 200,
            )
          ],
        ),
      ],
    );
  }
}
