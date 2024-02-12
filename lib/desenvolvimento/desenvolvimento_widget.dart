import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'desenvolvimento_model.dart';
export 'desenvolvimento_model.dart';

class DesenvolvimentoWidget extends StatefulWidget {
  const DesenvolvimentoWidget({super.key});

  @override
  State<DesenvolvimentoWidget> createState() => _DesenvolvimentoWidgetState();
}

class _DesenvolvimentoWidgetState extends State<DesenvolvimentoWidget> {
  late DesenvolvimentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesenvolvimentoModel());
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
        backgroundColor: Color(0xFF1F1F1F),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            setState(() {
              FFAppState().EventosFavoritos = [];
            });
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF030303),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final teste =
                                  FFAppState().EventosFavoritos.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: teste.length,
                                itemBuilder: (context, testeIndex) {
                                  final testeItem = teste[testeIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        testeItem.eventoImersID,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          testeItem.eventoOuImersao,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(
                      builder: (context) {
                        final teste2 = FFAppState().PalestrasFavoritas.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: teste2.length,
                          itemBuilder: (context, teste2Index) {
                            final teste2Item = teste2[teste2Index];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  teste2Item.id,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        FFAppState().visualizouVideo = false;
                      });
                    },
                    text: 'Retoma video',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                  ),
                  Builder(
                    builder: (context) {
                      final asdasd =
                          FFAppState().eventosLitados.map((e) => e).toList();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(asdasd.length, (asdasdIndex) {
                            final asdasdItem = asdasd[asdasdIndex];
                            return Text(
                              getJsonField(
                                asdasdItem,
                                r'''$.descricao''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            );
                          }),
                        ),
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      final asdasd2 = FFAppState()
                          .eventosListadosDestaqueDois
                          .map((e) => e)
                          .toList();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(asdasd2.length, (asdasd2Index) {
                            final asdasd2Item = asdasd2[asdasd2Index];
                            return Text(
                              asdasd2Item.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
