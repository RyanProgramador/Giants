import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listade_acertos_e_erros_widget.dart' show ListadeAcertosEErrosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListadeAcertosEErrosModel
    extends FlutterFlowModel<ListadeAcertosEErrosWidget> {
  ///  Local state fields for this component.

  List<String> acertos = [];
  void addToAcertos(String item) => acertos.add(item);
  void removeFromAcertos(String item) => acertos.remove(item);
  void removeAtIndexFromAcertos(int index) => acertos.removeAt(index);
  void insertAtIndexInAcertos(int index, String item) =>
      acertos.insert(index, item);
  void updateAcertosAtIndex(int index, Function(String) updateFn) =>
      acertos[index] = updateFn(acertos[index]);

  List<String> eros = [];
  void addToEros(String item) => eros.add(item);
  void removeFromEros(String item) => eros.remove(item);
  void removeAtIndexFromEros(int index) => eros.removeAt(index);
  void insertAtIndexInEros(int index, String item) => eros.insert(index, item);
  void updateErosAtIndex(int index, Function(String) updateFn) =>
      eros[index] = updateFn(eros[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
