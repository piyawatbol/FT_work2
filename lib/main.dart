// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_import, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:work2/models/transactions.dart';
import 'package:work2/provider/transaction_provider.dart';
import 'package:work2/screen/page2.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Mypage()),
    );
  }
}

class Mypage extends StatefulWidget {
  Mypage({Key? key}) : super(key: key);

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เเอพบัญชี"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Page2();
              }));
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, Widget? child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Text(
                'ไม่พบข้อมูล',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (BuildContext context, int index) {
                Transactions data = provider.transactions[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: FittedBox(
                        child: Text(data.amout.toString()),
                      ),
                    ),
                    title: Text(data.title),
                    subtitle: Text(DateFormat('dd/MM/yyyy').format(data.date)),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
