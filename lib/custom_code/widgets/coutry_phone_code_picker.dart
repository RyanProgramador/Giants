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

import 'package:country_code_picker/country_code_picker.dart';

class CoutryPhoneCodePicker extends StatefulWidget {
  const CoutryPhoneCodePicker({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CoutryPhoneCodePickerState createState() => _CoutryPhoneCodePickerState();
}

class _CoutryPhoneCodePickerState extends State<CoutryPhoneCodePicker> {
  CountryCode? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Color.fromARGB(0, 69, 0, 242), // fundo do select
      child: Column(
        children: [
          CountryCodePicker(
            onChanged: (CountryCode code) {
              setState(() {
                selectedCountry = code;
                FFAppState().coutryPickerCelularCadastro =
                    code.dialCode.toString();
              });
            },
            initialSelection: 'BR', // pais padrão
            favorite: ['US', 'BR'], // paises favo
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            textStyle: TextStyle(color: Colors.white), // White Text Color
            dialogTextStyle: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255)), // Dialog Text Color
            barrierColor: Color.fromARGB(65, 0, 0, 0), // Barrier Color
            dialogBackgroundColor:
                Color.fromARGB(255, 40, 40, 40), // Dialog Background Color
            searchDecoration: InputDecoration(
              hintText: 'Pesquisar...',
              hintStyle: TextStyle(color: Colors.white), // Search Hint Color
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Exemplo do Seletor de Código de País'),
      ),
      body: Center(child: CoutryPhoneCodePicker()),
    ),
  ));
}
