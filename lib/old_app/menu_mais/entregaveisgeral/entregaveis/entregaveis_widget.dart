import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/menu_mais/entregaveisgeral/listade_acertos_e_erros/listade_acertos_e_erros_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'entregaveis_model.dart';
export 'entregaveis_model.dart';

class EntregaveisWidget extends StatefulWidget {
  const EntregaveisWidget({super.key});

  @override
  State<EntregaveisWidget> createState() => _EntregaveisWidgetState();
}

class _EntregaveisWidgetState extends State<EntregaveisWidget> {
  late EntregaveisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntregaveisModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/padro_giants-1-removebg_1_(Traced).png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Entregáveis ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Giantas Denton',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: (_model.apiRequestCompleter ??=
                                            Completer<ApiCallResponse>()
                                              ..complete(
                                                  EntregaveisPorPessoaListaCall
                                                      .call(
                                                pesId: valueOrDefault<String>(
                                                  functions
                                                                  .qRcodeList(_model
                                                                      .qrCodeRetornoEntregaveis)
                                                                  ?.last !=
                                                              null &&
                                                          functions
                                                                  .qRcodeList(_model
                                                                      .qrCodeRetornoEntregaveis)
                                                                  ?.last !=
                                                              ''
                                                      ? valueOrDefault<String>(
                                                          functions.qRcodeList(
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .qrCodeRetornoEntregaveis,
                                                            '0',
                                                          ))?[1],
                                                          '0',
                                                        )
                                                      : '0',
                                                  '0',
                                                ),
                                                evenId: valueOrDefault<String>(
                                                  functions
                                                                  .qRcodeList(_model
                                                                      .qrCodeRetornoEntregaveis)
                                                                  ?.first !=
                                                              null &&
                                                          functions
                                                                  .qRcodeList(_model
                                                                      .qrCodeRetornoEntregaveis)
                                                                  ?.first !=
                                                              ''
                                                      ? valueOrDefault<String>(
                                                          functions
                                                              .qRcodeList(
                                                                  valueOrDefault<
                                                                      String>(
                                                                _model
                                                                    .qrCodeRetornoEntregaveis,
                                                                '0',
                                                              ))
                                                              ?.first,
                                                          '0',
                                                        )
                                                      : '0',
                                                  '0',
                                                ),
                                                evenOuImer:
                                                    valueOrDefault<String>(
                                                  functions
                                                      .qRcodeList(
                                                          valueOrDefault<
                                                              String>(
                                                        _model
                                                            .qrCodeRetornoEntregaveis,
                                                        '0',
                                                      ))
                                                      ?.last,
                                                  '0',
                                                ),
                                              )))
                                        .future,
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
                                      final listViewEntregaveisPorPessoaListaResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final entregaveisLista =
                                              EntregaveisPorPessoaListaCall
                                                      .dadosEntregaveisLista(
                                                    listViewEntregaveisPorPessoaListaResponse
                                                        .jsonBody,
                                                  )?.toList() ??
                                                  [];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.numeroDeEntregaveis =
                                                    entregaveisLista.length;
                                              });
                                            },
                                            child: RefreshIndicator(
                                              color: Colors.white,
                                              backgroundColor:
                                                  Colors.transparent,
                                              onRefresh: () async {
                                                setState(() {
                                                  _model.numeroDeEntregaveis =
                                                      entregaveisLista.length;
                                                });
                                                setState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                                await _model
                                                    .waitForApiRequestCompleted();
                                              },
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    entregaveisLista.length,
                                                itemBuilder: (context,
                                                    entregaveisListaIndex) {
                                                  final entregaveisListaItem =
                                                      entregaveisLista[
                                                          entregaveisListaIndex];
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 58.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF0F0F0F),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            entregaveisListaItem,
                                                                            r'''$.entre_nome''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Giantas Denton',
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                Colors.white,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.checkboxValueMap[entregaveisListaItem] ??=
                                                                                false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.checkboxValueMap[entregaveisListaItem] = newValue!);
                                                                              if (newValue!) {
                                                                                setState(() {
                                                                                  _model.addToQuaisSaoOsEntregaveis(getJsonField(
                                                                                    entregaveisListaItem,
                                                                                    r'''$.entre_id''',
                                                                                  ).toString());
                                                                                  _model.vez = _model.vez! + 1;
                                                                                });
                                                                              } else {
                                                                                setState(() {
                                                                                  _model.removeFromQuaisSaoOsEntregaveis(getJsonField(
                                                                                    entregaveisListaItem,
                                                                                    r'''$.entre_id''',
                                                                                  ).toString());
                                                                                  _model.vez = _model.vez! + -1;
                                                                                });
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                Colors.white,
                                                                            checkColor:
                                                                                Color(0xFF525252),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FFButtonWidget(
                                          key: ValueKey('teste'),
                                          onPressed: () async {
                                            var _shouldSetState = false;
                                            _model.qrCodeRetornoEntregaveis =
                                                await FlutterBarcodeScanner
                                                    .scanBarcode(
                                              '#C62828', // scanning line color
                                              'Cancel', // cancel button text
                                              true, // whether to show the flash icon
                                              ScanMode.QR,
                                            );

                                            _shouldSetState = true;
                                            if (_model
                                                    .qrCodeRetornoEntregaveis !=
                                                '-1') {
                                              setState(() => _model
                                                  .apiRequestCompleter = null);
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          text: 'Conferir entregáveis',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF2B2B2B),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            var _shouldSetState = false;
                                            _model.vez = _model
                                                .quaisSaoOsEntregaveis.length;
                                            _model.retornoApiEntregaveisEntreguesConcluidos =
                                                await ConfiurmaEntregaveisPorPessoasCall
                                                    .call(
                                              pesId: functions.qRcodeList(_model
                                                  .qrCodeRetornoEntregaveis)?[1],
                                              evenId: functions.qRcodeList(_model
                                                  .qrCodeRetornoEntregaveis)?[0],
                                              entregavelId:
                                                  functions.arrayToString(_model
                                                      .quaisSaoOsEntregaveis
                                                      .toList()),
                                              evenOuImer: functions
                                                  .qRcodeList(_model
                                                      .qrCodeRetornoEntregaveis)
                                                  ?.last,
                                            );
                                            _shouldSetState = true;
                                            if (!ConfiurmaEntregaveisPorPessoasCall
                                                .statusEntregaEntregaveis(
                                              (_model.retornoApiEntregaveisEntreguesConcluidos
                                                      ?.jsonBody ??
                                                  ''),
                                            )!) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Ops!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x00222222),
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 350.0,
                                                      child:
                                                          ListadeAcertosEErrosWidget(
                                                        acertos:
                                                            ConfiurmaEntregaveisPorPessoasCall
                                                                    .confirmadosEntregaEntregaveis(
                                                          (_model.retornoApiEntregaveisEntreguesConcluidos
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                                .map((e) => e
                                                                    .toString())
                                                                .toList(),
                                                        erros: ConfiurmaEntregaveisPorPessoasCall
                                                                .naoConfirmadorsEntregaEntregaveis(
                                                          (_model.retornoApiEntregaveisEntreguesConcluidos
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                            .map((e) =>
                                                                e.toString())
                                                            .toList(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          text: 'Salvar',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF555555),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
