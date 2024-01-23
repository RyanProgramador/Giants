import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/menu_mais/entregaveisgeral/listade_acertos_e_erros/listade_acertos_e_erros_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'entregaveis_widget.dart' show EntregaveisWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EntregaveisModel extends FlutterFlowModel<EntregaveisWidget> {
  ///  Local state fields for this page.

  int? numeroDeEntregaveis;

  int? vez;

  List<String> quaisSaoOsEntregaveis = [];
  void addToQuaisSaoOsEntregaveis(String item) =>
      quaisSaoOsEntregaveis.add(item);
  void removeFromQuaisSaoOsEntregaveis(String item) =>
      quaisSaoOsEntregaveis.remove(item);
  void removeAtIndexFromQuaisSaoOsEntregaveis(int index) =>
      quaisSaoOsEntregaveis.removeAt(index);
  void insertAtIndexInQuaisSaoOsEntregaveis(int index, String item) =>
      quaisSaoOsEntregaveis.insert(index, item);
  void updateQuaisSaoOsEntregaveisAtIndex(
          int index, Function(String) updateFn) =>
      quaisSaoOsEntregaveis[index] = updateFn(quaisSaoOsEntregaveis[index]);

  List<String> erros = [];
  void addToErros(String item) => erros.add(item);
  void removeFromErros(String item) => erros.remove(item);
  void removeAtIndexFromErros(int index) => erros.removeAt(index);
  void insertAtIndexInErros(int index, String item) =>
      erros.insert(index, item);
  void updateErrosAtIndex(int index, Function(String) updateFn) =>
      erros[index] = updateFn(erros[index]);

  List<String> acertos = [];
  void addToAcertos(String item) => acertos.add(item);
  void removeFromAcertos(String item) => acertos.remove(item);
  void removeAtIndexFromAcertos(int index) => acertos.removeAt(index);
  void insertAtIndexInAcertos(int index, String item) =>
      acertos.insert(index, item);
  void updateAcertosAtIndex(int index, Function(String) updateFn) =>
      acertos[index] = updateFn(acertos[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Checkbox widget.

  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  var qrCodeRetornoEntregaveis = '';
  // Stores action output result for [Backend Call - API (Confiurma Entregaveis por pessoas)] action in Button widget.
  ApiCallResponse? retornoApiEntregaveisEntreguesConcluidos;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
