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

Future abrirWhatsapp(String? numeroTelefone) async {
  if (numeroTelefone != null) {
    // Remover caracteres não numéricos do número de telefone
    final numeroLimpo = numeroTelefone.replaceAll(RegExp(r'[^0-9]'), '');

    // Certificar-se de que o número tenha um formato internacional
    final numeroFormatado =
        "55$numeroLimpo"; // 55 é o código de país para o Brasil, ajuste conforme necessário

    final url = "https://wa.me/$numeroFormatado";

    // Verifica se o aplicativo WhatsApp está instalado
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Se não estiver instalado, tenta abrir no navegador
      try {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } catch (e) {
        throw 'Não é possível abrir o WhatsApp';
      }
    }
  } else {
    throw 'Número de telefone do WhatsApp não fornecido';
  }
}
