
import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

void main() {
  runApp(MaterialApp(
    home: currency_converter(),
    debugShowCheckedModeBanner: false,
  ));
}

class currency_converter extends StatefulWidget {
  const currency_converter({Key? key}) : super(key: key);

  @override
  State<currency_converter> createState() => _currency_converterState();
}

class _currency_converterState extends State<currency_converter> {
  String c_name1 = "";
  String c_name2 = "";
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  String firstcode  ="USD";
  String secondcode  ="INR";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Currency",
              style: TextStyle(color: Model.black),
            ),
            backgroundColor: Model.teal),
        body: Center(
            child: Column(
          children: [

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: t1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Model.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Model.black)),
                      labelText: "Enter Value",
                      labelStyle: TextStyle(color: Model.black),
                    ),
                  ),
                ),
                TextButton(onPressed: () {
                  showCurrencyPicker(context: context, onSelect: (value) {
                    setState(() {
                      firstcode=  value.code;
                    });
                  },);
                }, child: Text("$firstcode",style: TextStyle(color: Colors.black)))
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async {
              var url = Uri.parse("https://pdfile7.000webhostapp.com/currency.php");
              var response  =await http.post(url,body: {
                'to':secondcode,
                'from':firstcode,
                'amount':t1.text,
              });

              print("response = ${response.body}");
              Map map  = jsonDecode(response.body);
              double result = map['result'];
              setState(() {
                t2.text = "$result";
              });

            }, child: Icon(Icons.autorenew_rounded)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: t2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Model.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Model.black)),
                      labelText: "Enter Value",
                      labelStyle: TextStyle(color: Model.black),
                    ),
                  ),
                ),
                TextButton(onPressed: () {
                  showCurrencyPicker(context: context, onSelect: (value) {
                    setState(() {
                      secondcode=  value.code;
                    });
                  },);
                }, child: Text("$secondcode",style: TextStyle(color: Colors.black),))
              ],
            ),

          ],
        )));
  }
}
