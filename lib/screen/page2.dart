// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use, avoid_returning_null_for_void, avoid_print, unused_local_variable
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work2/models/transactions.dart';
import 'package:work2/provider/transaction_provider.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final amoutController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: "ชื่อรายการ"),
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกชื่อรายการ';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: amoutController,
                  decoration: InputDecoration(labelText: "จำนวนเงิน"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกจำนวนเงิน';
                    }
                    if (value.isEmpty || double.parse(value) <= 0) {
                      return 'กรุณาใส่ค่ามากกว่า 0 บาท';
                    }
                    return null;
                  },
                ),
                FlatButton(
                    textColor: Colors.white,
                    child: Text('เพิ่มข้อมูล'),
                    color: Colors.green,
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        var title = titleController.text;
                        var amout = amoutController.text;

                        Transactions statement = Transactions(
                            title: title,
                            amout: double.parse(amout),
                            date: DateTime.now());

                        //เรียกข้อมูล
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);
                        provider.addTransaction(statement);
                        Navigator.pop(context);
                      }
                    }),
              ],
            )),
      ),
    );
  }
}
