// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CalendarRangerPicker extends StatefulWidget {
  const CalendarRangerPicker({
    Key? key,
    this.width,
    this.height,
    required this.updatePagina,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? updatePagina;
  @override
  _CalendarRangerPickerState createState() => _CalendarRangerPickerState();
}

class _CalendarRangerPickerState extends State<CalendarRangerPicker> {
  List<DateTime?> _dialogCalendarPickerValue = [null, null];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
      ],
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final values = await showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(
                      // You can customize your config here
                      calendarType: CalendarDatePicker2Type.range,
                    ),
                    dialogSize: const Size(325, 400), // Add dialogSize here
                  );
                  if (values != null) {
                    setState(() {
                      _dialogCalendarPickerValue = values;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF014040), // Change the button color here
                  elevation: 0, // Remove shadow
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0), // Rounded corners
                  ),
                  minimumSize: Size(83, 50), // Button size
                ),
                child: const Text('Buscar'),
              ),
              Text(
                _getValueText(
                  CalendarDatePicker2Type.range,
                  _dialogCalendarPickerValue,
                ),
                style: TextStyle(
                  color: Colors.transparent, // Set text color to transparent
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values = values
        .map((e) => e != null ? DateTime(e.year, e.month, e.day) : null)
        .toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0] != null
            ? DateTime(values[0]!.year, values[0]!.month, values[0]!.day)
            : null;
        final endDate = values.length > 1 && values[1] != null
            ? DateTime(values[1]!.year, values[1]!.month, values[1]!.day)
            : null;
        valueText = '$startDate to $endDate';
        //FFAppState().periodoInicialMarcacoesRange = startDate;
        //FFAppState().periodoFinalMarcacoesRange = endDate;
        widget.updatePagina;
      } else {
        //FFAppState().periodoInicialMarcacoesRange = null;
        //FFAppState().periodoFinalMarcacoesRange = null;
        widget.updatePagina;
        return 'null';
      }
    }

    return valueText;
  }
}
