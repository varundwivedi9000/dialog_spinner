library dialog_spinner;

import 'package:flutter/material.dart';

class DialogSpinner extends StatefulWidget {
  final List<String> spinnerList;
  final Function onValueChanged;

  final TextAlign textAlign;
  final TextStyle style;
  final TextAlign spinnerTextAlign;
  final TextStyle spinnerStyle;
  final EdgeInsets margin;
  final EdgeInsets spinnerMargin;
  final EdgeInsets padding;
  final EdgeInsets spinnerPadding;
  final Icon iconDropDown;
  final Color color;
  final Decoration dialogDecoration;
  final Decoration spinnerDecoration;

  final double elevation;
  final double width;
  final double height;

  DialogSpinner({
    @required this.spinnerList,
    @required this.onValueChanged(int index),
    this.textAlign = TextAlign.center,
    this.style = const TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
    this.spinnerTextAlign = TextAlign.center,
    this.spinnerStyle = const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black),
    this.margin = const EdgeInsets.all(0),
    this.spinnerMargin = const EdgeInsets.all(5),
    this.padding = const EdgeInsets.all(0),
    this.spinnerPadding = const EdgeInsets.all(10.0),
    this.iconDropDown = const Icon(Icons.arrow_drop_down),
    this.color,
    this.dialogDecoration,
    this.spinnerDecoration,
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
  String hint;

  @override
  void initState() {
    super.initState();
    hint = widget.spinnerList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      child: Card(
        elevation: widget.elevation,
        margin: EdgeInsets.all(0),
        child: FlatButton(
          padding: widget.padding,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: widget.color,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  hint,
                  textAlign: widget.textAlign,
                  style: widget.style,
                ),
              ),
              widget.iconDropDown,
            ],
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.all(0),
                    content: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: widget.dialogDecoration,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: widget.spinnerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: widget.elevation,
                              margin: widget.spinnerMargin,
                              child: InkWell(
                                child: Container(
                                  decoration: widget.spinnerDecoration,
                                  padding: widget.spinnerPadding,
                                  child: Text(
                                    widget.spinnerList[index],
                                    textAlign: widget.spinnerTextAlign,
                                    style: widget.spinnerStyle,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    hint = widget.spinnerList[index];
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
