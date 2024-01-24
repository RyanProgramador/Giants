import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

DateTime? strDataParaDateTime(String? data) {
  if (data == null) {
    return null;
  }

  try {
    // Use o construtor DateTime.parse para converter a string em um DateTime
    DateTime dateTime = DateTime.parse(data);
    return dateTime;
  } catch (e) {
    // Se a conversão falhar, retorne null ou trate o erro de acordo com sua necessidade
    return null;
  }
}

double? multPor100(double? entra) {
  if (entra != null) {
    var resultado = entra * 100;
    return double.parse(resultado.toStringAsFixed(2));
  } else {
    return 0.50;
  }
}

bool? compareListas(
  String valor1ID,
  List<PalestrasFavoritadasStruct> lista,
) {
  for (PalestrasFavoritadasStruct item in lista) {
    if (item.id == valor1ID) {
      return true;
    }
  }

  return false;
}

List<String>? qRcodeList(String? entradaQRCode) {
  if (entradaQRCode != null) {
    // Divide a entrada com base no separador '///' e remove espaços em branco
    List<String> partes =
        entradaQRCode.split(' /// ').map((parte) => parte.trim()).toList();

    // Retorna a lista resultante
    return partes;
  } else {
    return null; // Retorna null se a entrada for nula
  }
}

String? arrayToString(List<String>? array) {
  if (array == null || array.isEmpty) {
    return null;
  }

  return array.join(" /// ");
}

bool? compareDuasListas(
  String valor1ID,
  String valor2ImerOuEven,
  List<EventosFavoritadosStruct> lista,
) {
  for (EventosFavoritadosStruct item in lista) {
    if (item.eventoImersID == valor1ID &&
        item.eventoOuImersao == valor2ImerOuEven) {
      return true;
    }
  }

  return false;
}

int? stringToInt(String? stringQueViraraInt) {
  if (stringQueViraraInt == null) {
    return null; // Retorna nulo se a string de entrada for nula
  }

  // Tenta converter a string para um inteiro
  return int.tryParse(stringQueViraraInt);
}
