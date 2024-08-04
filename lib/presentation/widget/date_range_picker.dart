import 'package:flutter/material.dart';
import 'package:todolist/presentation/resources/font_manager.dart';
import 'package:todolist/presentation/widget/app_button.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime startDate, DateTime endDate) onDateRangeSelected;
  CustomDatePicker({required this.onDateRangeSelected});
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    // Initialize start and end dates to current date
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)), // Previous year
      lastDate: DateTime.now().add(Duration(days: 365)), // Next year
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: const Color.fromARGB(
                  255, 238, 131, 73), // Change calendar header color
              onPrimary: Colors.black, // Change calendar header text color
              surface: Colors.white, // Change background color
              onSurface: Colors.black, // Change text color
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String startData =
        '${_startDate.day.toString().padLeft(2, '0')}/${_startDate.month.toString().padLeft(2, '0')}/${_startDate.year.toString().substring(2)}';
    String endDate =
        "${_endDate.day.toString().padLeft(2, '0')}/${_endDate.month.toString().padLeft(2, '0')}/${_endDate.year.toString().substring(2)}";

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    'SELECT DATE',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        // Perform any action with selected dates
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)) // Placeholder for close button
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  children: [
                    Text(
                      'StartDate',
                      style: TextStyle(
                          color: Color.fromARGB(255, 238, 131, 73),
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(context, true),
                      child: Text(
                        startData,
                        style: TextStyle(
                            color: Color.fromARGB(255, 238, 131, 73),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 238, 131, 73)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "End Date",
                      style: TextStyle(
                          color: Color.fromARGB(255, 238, 131, 73),
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(context, false),
                      child: Text(
                        endDate,
                        style: TextStyle(
                            color: Color.fromARGB(255, 238, 131, 73),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 238, 131, 73)),
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(height: 40),
              SizedBox(height: 40),
              AppButton(
                btnText: 'Search',
                onClick: () {
                  widget.onDateRangeSelected(_startDate, _endDate);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
