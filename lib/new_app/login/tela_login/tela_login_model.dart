import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'tela_login_widget.dart' show TelaLoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TelaLoginModel extends FlutterFlowModel<TelaLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - lembrarSenha] action in TelaLogin widget.
  bool? lembrarSenha;
  // Stores action output result for [Backend Call - API (Login)] action in TelaLogin widget.
  ApiCallResponse? loginLembrarSenha;
  // Stores action output result for [Backend Call - API (ListarEventos)] action in TelaLogin widget.
  ApiCallResponse? apicallListarEventos;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for Senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? login;
  // Stores action output result for [Backend Call - API (PorcentagemCFG)] action in Button widget.
  ApiCallResponse? retornoPorcentagemCFG;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    senhaFocusNode?.dispose();
    senhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
