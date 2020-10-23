import 'dart:core';
import 'package:flutter/material.dart';

class CalendarPickerSample extends StatefulWidget {
  @override
  _CalendarPickerSampleState createState() => _CalendarPickerSampleState();
}

class _CalendarPickerSampleState extends State<CalendarPickerSample> {
  DateTime date;
  DateTimeRange dateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Center(
            child: Column(
          children: [
            date == null
                ? Text('Select date from picker.')
                : Text('Picked Date: ${dateString(date)}'),
            RaisedButton(
                child: Text('Date Picker'),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 90)),
                  ).then((value) {
                    setState(() {
                      date = value;
                    });
                  });
                }),
            dateRange == null
                ? Text('Select date range from picker.')
                : Text(
                    'Picked Date Range: ${dateString(dateRange.start)} ~ ${dateString(dateRange.end)}'),
            RaisedButton(
                child: Text('Date Range Picker'),
                onPressed: () {
                  showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 90)),
                  ).then((value) {
                    setState(() {
                      dateRange = value;
                    });
                  });
                })
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        )));
  }

  String dateString(final DateTime date) {
    final monthText = '${date.month}'.padLeft(2, '0');
    final dayText = '${date.day}'.padLeft(2, '0');
    return '${date.year}-$monthText-$dayText';
  }
}
