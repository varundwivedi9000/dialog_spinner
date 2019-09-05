# dialog_spinner

A Flutter package to make dialog mode of spinner in android available in flutter

## Installing

* To use this package, add ```dialog_spinner``` as a dependency in your pubspec.yaml file

## Example

    import 'package:flutter/material.dart';
    import 'package:dialog_spinner/dialog_spinner.dart';

    void main() => runApp(
          MaterialApp(
            title: "Test App",
            home: MyApp(),
          ),
        );

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
        "Item 16",
        "Item 17",
        "Item 18",
        "Item 19",
        "Item 20",
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
              ),
              Expanded(
                child: Center(
                  child: Text(
                    currentItem + " is selected",
                  ),
                ),
              )
            ],
          ),
        );
      }
    }