import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    double sizeScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(sizeScreen * 0.05, sizeScreen * 0.1,
                  sizeScreen * 0.05, sizeScreen * 0.03),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: sizeScreen * 0.15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(sizeScreen * 0.05),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blueGrey.shade200,
                                  blurRadius: 0.1,
                                  offset: Offset(0.2, 0.1),
                                  spreadRadius: 0.01)
                            ]),
                        child: Center(
                          child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              alignment: Alignment.center,
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Информация о получателе",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: sizeScreen * 0.05,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sizeScreen * 0.02,
                  ),
                  Text("Получатель"),
                  TextField(
                      decoration:
                          InputDecoration(border: OutlineInputBorder())),
                  SizedBox(
                    height: sizeScreen * 0.02,
                  ),
                  Text("Получатель телефон"),
                  TextField(
                      decoration:
                          InputDecoration(border: OutlineInputBorder())),
                  SizedBox(
                    height: sizeScreen * 0.02,
                  ),
                  Text("Получатель адрес"),
                  TextField(
                      decoration:
                          InputDecoration(border: OutlineInputBorder())),
                  SizedBox(
                    height: sizeScreen * 0.02,
                  ),
                ],
              ),
            ),
            Text("Дата"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizeScreen * 0.045),
              child: DateTimePicker(
                confirmText: "Ок",
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.date_range,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder()),
                calendarTitle: "RUS",
                cancelText: "Ken",
                dateMask: 'd MMM, yyyy',
                dateHintText: "text",
                firstDate: DateTime(2021, 3),
                lastDate: DateTime(2050),
                dateLabelText: 'Ден',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);

                  return null;
                },
                onSaved: (val) => print(val),
              ),
            ),
            Text("Время"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizeScreen * 0.045),
              child: DateTimePicker(
                type: DateTimePickerType.time,
                confirmText: "Ок",
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.timer_outlined,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder()),
                calendarTitle: "RUS",
                cancelText: "Ken",
                dateMask: 'd MMM, yyyy',
                dateHintText: "text",
                firstDate: DateTime(2021, 3),
                lastDate: DateTime(2050),
                dateLabelText: 'Ден',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);

                  return null;
                },
                onSaved: (val) => print(val),
              ),
            ),
            Text("Получатель"),
            Container(
              margin: EdgeInsets.fromLTRB(
                  sizeScreen * 0.05, 1, sizeScreen * 0.05, sizeScreen * 0.03),
              child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder())),
            ),
            Container(

              child: Column(
                children: [
                  SwitchListTile(
                    value: true,
                    onChanged: null,
                    title: Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                          activeColor: Colors.green,
                        ), Text("")
                      ],
                    ),
                    activeColor: Colors.green,
                  ),
                  SwitchListTile(
                    value: true,
                    onChanged: null,
                    title: Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                          activeColor: Colors.green,
                        ), Text("")
                      ],
                    ),
                    activeColor: Colors.green,
                  ),
                  SwitchListTile(
                    value: true,
                    onChanged: null,
                    title: Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                          activeColor: Colors.green,
                        ), Text("")
                      ],
                    ),
                    activeColor: Colors.green,
                  ),
                  Divider(),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  sizeScreen * 0.05, 1, sizeScreen * 0.05, sizeScreen * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Summa 123456"),
                MaterialButton(
                    color: Colors.blue.shade800,
                    textColor: Colors.white,

                    focusColor:  Colors.blue,
                    child: Text("Подтверждать"),
                    onPressed: (){

                    }),

              ],),
            )
          ],
        ),
      ),
    );
  }
}
