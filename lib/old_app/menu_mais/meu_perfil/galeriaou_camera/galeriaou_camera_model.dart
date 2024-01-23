import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'galeriaou_camera_widget.dart' show GaleriaouCameraWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GaleriaouCameraModel extends FlutterFlowModel<GaleriaouCameraWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - fotoCamera] action in Button widget.
  String? erro1;
  // Stores action output result for [Backend Call - API (Trocar foto perfil)] action in Button widget.
  ApiCallResponse? retornoTrocaImagem;
  // Stores action output result for [Custom Action - fotoGaleria] action in Button widget.
  String? erro1Copy;
  // Stores action output result for [Backend Call - API (Trocar foto perfil)] action in Button widget.
  ApiCallResponse? retornoTrocaImagemGaleria;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
