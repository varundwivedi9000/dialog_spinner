library dialog_spinner;

import 'package:flutter/material.dart';

class DialogSpinner extends StatefulWidget {
  final List<String> spinnerList;
  final Function onValueChanged;

  final TextAlign spinnerHintAlign;
  final TextStyle spinnerHintStyle;
  final TextAlign dropDownTextAlign;
  final TextStyle dropDownTextStyle;
  final Icon dropDownIcon;

  final double elevation;
  final double width;
  final double height;

  DialogSpinner({
    @required this.spinnerList,
    @required this.onValueChanged(int index),
    this.spinnerHintAlign = TextAlign.center,
    this.spinnerHintStyle = const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.dropDownTextAlign = TextAlign.center,
    this.dropDownTextStyle = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    this.dropDownIcon = const Icon(Icons.arrow_drop_down),
    this.elevation = 2.0,
    this.width,
    this.height,
  });

  @override
  State<StatefulWidget> createState() {
    return _DialogSpinnerState();
  }
}

class _DialogSpinnerState extends State<DialogSpinner> {
  String spinnerHint;

  @override
  void initState() {
    super.initState();
    spinnerHint = widget.spinnerList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (widget.width == null)
          ? MediaQuery.of(context).size.width
          : widget.width,
      height: widget.height,
      child: Card(
        elevation: widget.elevation,
        child: FlatButton(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  spinnerHint,
                  textAlign: widget.spinnerHintAlign,
                  style: widget.spinnerHintStyle,
                ),
              ),
              widget.dropDownIcon,
            ],
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: widget.spinnerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: widget.elevation,
                              child: InkWell(
                                child: Container(
                                  margin: EdgeInsets.all(15.0),
                                  child: Text(
                                    widget.spinnerList[index],
                                    textAlign: widget.dropDownTextAlign,
                                    style: widget.dropDownTextStyle,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    spinnerHint = widget.spinnerList[index];
                                  });
                                  widget.onValueChanged(index);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
