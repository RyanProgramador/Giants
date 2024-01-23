import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'alterar_senha_widget.dart' show AlterarSenhaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlterarSenhaModel extends FlutterFlowModel<AlterarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for senhaatuall widget.
  FocusNode? senhaatuallFocusNode;
  TextEditingController? senhaatuallController;
  late bool senhaatuallVisibility;
  String? Function(BuildContext, String?)? senhaatuallControllerValidator;
  // State field(s) for novasenha widget.
  FocusNode? novasenhaFocusNode;
  TextEditingController? novasenhaController;
  late bool novasenhaVisibility;
  String? Function(BuildContext, String?)? novasenhaControllerValidator;
  // State field(s) for confirmanovasenha widget.
  FocusNode? confirmanovasenhaFocusNode;
  TextEditingController? confirmanovasenhaController;
  late bool confirmanovasenhaVisibility;
  String? Function(BuildContext, String?)? confirmanovasenhaControllerValidator;
  // Stores action output result for [Backend Call - API (AlterarSenha)] action in Button widget.
  ApiCallResponse? retornoAlterarSenha;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaatuallVisibility = false;
    novasenhaVisibility = false;
    confirmanovasenhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    senhaatuallFocusNode?.dispose();
    senhaatuallController?.dispose();

    novasenhaFocusNode?.dispose();
    novasenhaController?.dispose();

    confirmanovasenhaFocusNode?.dispose();
    confirmanovasenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
