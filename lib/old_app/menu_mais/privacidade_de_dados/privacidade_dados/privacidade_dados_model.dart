import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'privacidade_dados_widget.dart' show PrivacidadeDadosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrivacidadeDadosModel extends FlutterFlowModel<PrivacidadeDadosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for zap widget.
  bool? zapValue;
  // State field(s) for linkdin widget.
  bool? linkdinValue;
  // State field(s) for insta widget.
  bool? instaValue;
  // State field(s) for fot widget.
  bool? fotValue;
  // Stores action output result for [Backend Call - API (AtualizaPrivacidadeDeDados)] action in FloatingActionButton widget.
  ApiCallResponse? apiResult6sz;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
