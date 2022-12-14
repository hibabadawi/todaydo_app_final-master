import 'package:flutter/material.dart';


import '';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String _selectedDate = 'Pick date';
  String _selectedTime = 'Pick time';

  Future _pickDate() async {
    DateTime? datepick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));
    if (datepick != null)
      setState(() {
        _selectedDate = datepick.toString();
      });
  }

  Future _pickTime() async {
    TimeOfDay? timepick = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());
    if (timepick != null) {
      setState(() {
        _selectedTime = timepick.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
                "Add new event",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          SizedBox(
            height: 24,
          ),
          CustomDateTimePicker(
            icon: Icons.date_range,
            onPressed: _pickDate,
            value: _selectedDate,
          ),
          CustomDateTimePicker(
            icon: Icons.access_time,
            onPressed: _pickTime,
            value: _selectedTime,
          ),
          SizedBox(
            height: 24,
          ),

        ],
      ),
    );

  }

  CustomDateTimePicker({required IconData icon, required Future Function() onPressed, required String value}) {}
}
