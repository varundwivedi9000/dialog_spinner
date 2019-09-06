import 'package:flutter/material.dart';
import 'package:dialog_spinner/dialog_spinner.dart';

void main() => runApp(MaterialApp(
      title: "Test App",
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  final List<String> spinnerList = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "Item 13",
    "Item 14",
    "Item 15",
  ];

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String currentItem;

  @override
  void initState() {
    super.initState();
    currentItem = widget.spinnerList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DialogSpinner(
            spinnerList: widget.spinnerList,
            onValueChanged: (int index) {
              setState(() {
                currentItem = widget.spinnerList[index];
              });
            },
            width: 300,
            height: 50,
            margin: EdgeInsets.all(10.0),
            color: Colors.blue,
            dialogDecoration: BoxDecoration(
              color: Colors.blue,
            ),
            spinnerDecoration: BoxDecoration(
              color: Colors.white,
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            spinnerStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                currentItem + " is selected.",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
