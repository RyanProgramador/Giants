import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'maps_modal_model.dart';
export 'maps_modal_model.dart';

class MapsModalWidget extends StatefulWidget {
  const MapsModalWidget({
    super.key,
    required this.nomeTitulo,
    required this.exclusivoGiatnts,
    required this.dataEvento,
    required this.localEvento,
    required this.sobreEvento,
    required this.fotoBase64,
    required this.dataEventoFim,
    required this.idEvento,
    required this.marker,
  });

  final String? nomeTitulo;
  final bool? exclusivoGiatnts;
  final String? dataEvento;
  final String? localEvento;
  final String? sobreEvento;
  final String? fotoBase64;
  final String? dataEventoFim;
  final String? idEvento;
  final FFPlace? marker;

  @override
  State<MapsModalWidget> createState() => _MapsModalWidgetState();
}

class _MapsModalWidgetState extends State<MapsModalWidget> {
  late MapsModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapsModalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0xFF313233),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    'Maps',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Open Sans',
                          fontSize: 20.0,
                        ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0xFF1B1C1D),
            ),
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Em desenvolvimento...',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '[Local]',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Guie-me',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
