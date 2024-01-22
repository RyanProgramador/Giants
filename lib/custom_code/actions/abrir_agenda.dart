// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

Future abrirAgenda(
  String? dataEvento,
  String? dataFim,
  String? local,
  String? nome,
  String? descricao,
) async {
  if (dataEvento != null && dataFim != null && nome != null) {
    DateTime inicio = DateTime.parse(dataEvento);
    DateTime fim = DateTime.parse(dataFim);

    String formattedDataInicio =
        "${inicio.year}${inicio.month.toString().padLeft(2, '0')}${inicio.day.toString().padLeft(2, '0')}";
    String formattedHoraInicio =
        "${inicio.hour.toString().padLeft(2, '0')}${inicio.minute.toString().padLeft(2, '0')}";

    String formattedDataFim =
        "${fim.year}${fim.month.toString().padLeft(2, '0')}${fim.day.toString().padLeft(2, '0')}";
    String formattedHoraFim =
        "${fim.hour.toString().padLeft(2, '0')}${fim.minute.toString().padLeft(2, '0')}";

    // Encode nome, local e descrição para serem incluídos na URL
    String encodedNome = Uri.encodeComponent(nome);
    String encodedLocal = Uri.encodeComponent(local ?? '');
    String encodedDescricao = Uri.encodeComponent(descricao ?? '');

    String url =
        'https://www.google.com/calendar/render?action=TEMPLATE&text=$encodedNome&dates=$formattedDataInicio"$formattedHoraInicio' +
            'T00/$formattedDataFim"$formattedHoraFim' +
            'T00&details=$encodedDescricao&location=$encodedLocal';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o Google Agenda.';
    }
  }
}
