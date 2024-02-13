// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:calendar_date_picker2/calendar_date_picker2.dart';

Future<List<DateTime>> selectDateRange(BuildContext context) async {
  final List<DateTime?>? returnedValues = await showCalendarDatePicker2Dialog(
    context: context,
    config: CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.range,
    ),
    dialogSize: const Size(325, 400),
  );

  // Retorna a lista de DateTime se não for nula, removendo quaisquer valores nulos, ou uma lista vazia caso contrário.
  return returnedValues?.whereType<DateTime>().toList() ?? [];
}
