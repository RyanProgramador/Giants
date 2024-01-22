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

Future abrirLinkedin(String? perfil) async {
  if (perfil != null) {
    // Remove qualquer espaço em branco no início e no final do perfil
    perfil = perfil.trim();
    perfil = perfil.replaceAll(' ', '%20');

    //final url = "https://www.linkedin.com/in/$perfil/";
    final url =
        "https://www.linkedin.com/search/results/all/?heroEntityKey=urn%3Ali%3Afsd_profile%3AACoAADquTksBDG0k1edcuSiIewGGBK5Gq6xDTus&keywords=$perfil&origin=RICH_QUERY_SEARCH_HOME_HISTORY&sid=tZZ";

    // Verifica se o aplicativo LinkedIn está instalado
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Se não estiver instalado, tenta abrir no navegador
      try {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } catch (e) {
        throw 'Não é possível abrir o LinkedIn';
      }
    }
  } else {
    throw 'Nome de perfil do LinkedIn não fornecido';
  }
}
