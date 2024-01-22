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
import 'package:uni_links/uni_links.dart';

Future abrirInsta(String? instagram) async {
  if (instagram != null) {
    // Verifica se o "@" está presente no início do nome de usuário
    if (!instagram.startsWith('@')) {
      instagram = '$instagram';
    } else {
      instagram = instagram.replaceAll('@', '');
    }

    final url = "https://www.instagram.com/$instagram/";

    // Verifica se o aplicativo Instagram está instalado
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Se não estiver instalado, tenta abrir no navegador
      try {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } catch (e) {
        throw 'Não é possível abrir o Instagram';
      }
    }
  } else {
    throw 'Nome de usuário do Instagram não fornecido';
  }
}
