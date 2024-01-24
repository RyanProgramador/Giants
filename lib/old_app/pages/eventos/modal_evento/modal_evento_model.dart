import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/pages/eventos/modal_do_qr_code/modal_do_qr_code_widget.dart';
import '/old_app/pages/eventos/modal_listagem_presenca/modal_listagem_presenca_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'modal_evento_widget.dart' show ModalEventoWidget;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalEventoModel extends FlutterFlowModel<ModalEventoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (CadastraEventoPessoa)] action in Button widget.
  ApiCallResponse? cadastraEventoPessoaRetorno;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
