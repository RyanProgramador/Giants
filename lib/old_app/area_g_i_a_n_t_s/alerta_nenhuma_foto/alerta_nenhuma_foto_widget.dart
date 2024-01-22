import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alerta_nenhuma_foto_model.dart';
export 'alerta_nenhuma_foto_model.dart';

class AlertaNenhumaFotoWidget extends StatefulWidget {
  const AlertaNenhumaFotoWidget({Key? key}) : super(key: key);

  @override
  _AlertaNenhumaFotoWidgetState createState() =>
      _AlertaNenhumaFotoWidgetState();
}

class _AlertaNenhumaFotoWidgetState extends State<AlertaNenhumaFotoWidget> {
  late AlertaNenhumaFotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertaNenhumaFotoModel());
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
        'Nenhuma foto ainda!',
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
    );
  }
}
