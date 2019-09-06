# Dialog Spinner Example

An example flutter project to show working of package dialog_spinner.

## Using this example

* Download example project or use following code in your project.  

## Example

    import 'package:flutter/material.dart';
    import 'package:dialog_spinner/dialog_spinner.dart';

    void main() => runApp(MaterialApp(home: MyApp()));

    class MyApp extends StatefulWidget {
      final List<String> spinnerList = ["Item 1", "Item 2","Item 3", "Item 4", "Item 5"];

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
            title: Text("Dialog Spinner Example"),
          ),
          body: Column(
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
                    currentItem + " is selected.",
                  ),
                ),
              )
            ],
          ),
        );
      }
    }
