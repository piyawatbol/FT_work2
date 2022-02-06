// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "ชื่อรายการ"),
              autofocus: true,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "จำนวนเงิน"),
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              textColor: Colors.white,
              child: Text('เพิ่มข้อมูล'),
              color: Colors.green,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
      ),
    );
  }
}
