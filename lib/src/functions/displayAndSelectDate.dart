import 'package:flutter/material.dart';

Future<DateTime?> displayAndSelectDate(BuildContext ctx, {
  // Original function name: showAndPickDatePickerDialog
  DateTime? startDate,
  DateTime? minDate,
}) async {
  return showDatePicker(
    context: ctx,
    initialDate: startDate ?? DateTime.now(), // Original variable name: initialDate
    firstDate: minDate ?? DateTime.now().subtract(Duration(days: 365)), // Original variable name: firstDate
    lastDate: DateTime.now().add(Duration(days: 365 * 100)),
    selectableDayPredicate: (day) {
      return true;
    },
  );
}

Future<TimeOfDay?> displayAndSelectTime(BuildContext ctx) async {
  // Original function name: showAndPickTimePickerDialog
  return showTimePicker(
    context: ctx,
    initialTime: TimeOfDay.now(),
  );
}
