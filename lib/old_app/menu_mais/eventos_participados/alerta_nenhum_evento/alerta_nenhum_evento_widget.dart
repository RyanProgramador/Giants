import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alerta_nenhum_evento_model.dart';
export 'alerta_nenhum_evento_model.dart';

class AlertaNenhumEventoWidget extends StatefulWidget {
  const AlertaNenhumEventoWidget({super.key});

  @override
  State<AlertaNenhumEventoWidget> createState() =>
      _AlertaNenhumEventoWidgetState();
}

class _AlertaNenhumEventoWidgetState extends State<AlertaNenhumEventoWidget> {
  late AlertaNenhumEventoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertaNenhumEventoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        'Nenhum evento participado ainda!',
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
    );
  }
}
