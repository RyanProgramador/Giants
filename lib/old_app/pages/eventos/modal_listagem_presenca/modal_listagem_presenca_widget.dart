import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_listagem_presenca_model.dart';
export 'modal_listagem_presenca_model.dart';

class ModalListagemPresencaWidget extends StatefulWidget {
  const ModalListagemPresencaWidget({
    super.key,
    required this.eventoID,
    required this.evenOuimer,
  });

  final String? eventoID;
  final String? evenOuimer;

  @override
  State<ModalListagemPresencaWidget> createState() =>
      _ModalListagemPresencaWidgetState();
}

class _ModalListagemPresencaWidgetState
    extends State<ModalListagemPresencaWidget> {
  late ModalListagemPresencaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalListagemPresencaModel());
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
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0x00060606),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 30.0, 0.0),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 0.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future:
                                  ListarMembrosPresentesEmEventosOuImersoesCall
                                      .call(
                                idEventoOuImer: widget.eventoID,
                                evenOuImer: widget.evenOuimer,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final listViewListarMembrosPresentesEmEventosOuImersoesResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final presenca =
                                        ListarMembrosPresentesEmEventosOuImersoesCall
                                                .dadosListarMembrosPresentes(
                                              listViewListarMembrosPresentesEmEventosOuImersoesResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: presenca.length,
                                      itemBuilder: (context, presencaIndex) {
                                        final presencaItem =
                                            presenca[presencaIndex];
                                        return Container(
                                          width: double.infinity,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x002F2F2F),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 7,
                                                child: Text(
                                                  getJsonField(
                                                    presencaItem,
                                                    r'''$.nome_pessoa''',
                                                  )
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                        maxChars: 15,
                                                        replacement: '…',
                                                      ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Giantas Denton',
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 100.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  getJsonField(
                                                    presencaItem,
                                                    r'''$.presente''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
