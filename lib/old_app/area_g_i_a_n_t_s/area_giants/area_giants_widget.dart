import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'area_giants_model.dart';
export 'area_giants_model.dart';

class AreaGiantsWidget extends StatefulWidget {
  const AreaGiantsWidget({Key? key}) : super(key: key);

  @override
  _AreaGiantsWidgetState createState() => _AreaGiantsWidgetState();
}

class _AreaGiantsWidgetState extends State<AreaGiantsWidget> {
  late AreaGiantsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AreaGiantsModel());
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Prancheta_5_cpia@4x.png',
                              height: MediaQuery.sizeOf(context).height * 0.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 30.0, 0.0),
                          child: ClipOval(
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                child: custom_widgets.HtmlImageCopyCopy(
                                  width: 50.0,
                                  height: 50.0,
                                  base64Image: valueOrDefault<String>(
                                    FFAppState().UsrPicture != null &&
                                            FFAppState().UsrPicture != ''
                                        ? FFAppState().UsrPicture
                                        : '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',
                                    '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',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (true == false)
                  Expanded(
                    flex: 10,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FlutterFlowVideoPlayer(
                                path:
                                    'https://assets.mixkit.co/videos/preview/mixkit-big-tree-seen-through-defocused-drops-3986-large.mp4',
                                videoType: VideoType.network,
                                autoPlay: true,
                                looping: true,
                                showControls: false,
                                allowFullScreen: false,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 90.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Fechar',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF2B2B2B),
                                  textStyle: FlutterFlowTheme.of(context)
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
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().UsrClass != 4)
                  Expanded(
                    flex: 10,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 35.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (FFAppState().visualizouVideo == false)
                                ClipRRect(
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.86,
                                    decoration: BoxDecoration(
                                      color: Color(0x002F2F2F),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.95,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: FlutterFlowVideoPlayer(
                                            path:
                                                'assets/videos/Entrada_Giants.mp4',
                                            videoType: VideoType.asset,
                                            width: double.infinity,
                                            height: double.infinity,
                                            autoPlay: true,
                                            looping: false,
                                            showControls: false,
                                            allowFullScreen: false,
                                            allowPlaybackSpeedMenu: false,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 0.0, 30.0, 50.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState().visualizouVideo =
                                                      true;
                                                });
                                              },
                                              text: 'Fechar',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF2B2B2B),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (FFAppState().visualizouVideo == true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 25.0, 40.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: ListarGIANTSCall.call(),
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
                                      final wrapListarGIANTSResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final listaGiants = getJsonField(
                                            wrapListarGIANTSResponse.jsonBody,
                                            r'''$.dados''',
                                          ).toList();
                                          return Wrap(
                                            spacing: 8.0,
                                            runSpacing: 5.0,
                                            alignment: WrapAlignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                listaGiants.length,
                                                (listaGiantsIndex) {
                                              final listaGiantsItem =
                                                  listaGiants[listaGiantsIndex];
                                              return Container(
                                                width: 165.0,
                                                height: 258.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            900.0) {
                                                          return 171.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 179.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 171.0;
                                                        } else {
                                                          return 171.0;
                                                        }
                                                      }(),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x002F2F2F),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: custom_widgets
                                                            .HtmlImageCopyCopy(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          base64Image:
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                                      listaGiantsItem,
                                                                      r'''$.foto_principal''',
                                                                    ) !=
                                                                    null
                                                                ? getJsonField(
                                                                    listaGiantsItem,
                                                                    r'''$.foto_principal''',
                                                                  ).toString()
                                                                : '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',
                                                            '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',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          listaGiantsItem,
                                                          r'''$.nome''',
                                                        )
                                                            .toString()
                                                            .maybeHandleOverflow(
                                                              maxChars: 14,
                                                              replacement: '…',
                                                            ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Giantas Denton',
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        listaGiantsItem,
                                                        r'''$.empresa''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 15,
                                                            replacement: '…',
                                                          ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        if (valueOrDefault<
                                                            bool>(
                                                          () {
                                                            if (getJsonField(
                                                                  listaGiantsItem,
                                                                  r'''$.instagram''',
                                                                ) !=
                                                                null) {
                                                              return true;
                                                            } else if (getJsonField(
                                                                  listaGiantsItem,
                                                                  r'''$.instagram''',
                                                                ) !=
                                                                null) {
                                                              return true;
                                                            } else {
                                                              return false;
                                                            }
                                                          }(),
                                                          false,
                                                        ))
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await actions
                                                                  .abrirInsta(
                                                                getJsonField(
                                                                  listaGiantsItem,
                                                                  r'''$.instagram''',
                                                                ).toString(),
                                                              );
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .instagram,
                                                              color:
                                                                  Colors.white,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          () {
                                                            if (getJsonField(
                                                                  listaGiantsItem,
                                                                  r'''$.zap''',
                                                                ) !=
                                                                null) {
                                                              return true;
                                                            } else if (getJsonField(
                                                                  listaGiantsItem,
                                                                  r'''$.zap''',
                                                                ) !=
                                                                null) {
                                                              return true;
                                                            } else {
                                                              return false;
                                                            }
                                                          }(),
                                                          false,
                                                        ))
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await actions
                                                                  .abrirWhatsapp(
                                                                getJsonField(
                                                                  listaGiantsItem,
                                                                  r'''$.zap''',
                                                                ).toString(),
                                                              );
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .whatsapp,
                                                              color:
                                                                  Colors.white,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          () {
                                                            if (getJsonField(
                                                                  listaGiantsItem,
                                                                  r'''$.linkedin''',
                                                                ) !=
                                                                null) {
                                                              return true;
                                                            } else if (getJsonField(
                                                                  listaGiantsItem,
                                                                  r'''$.linkedin''',
                                                                ) !=
                                                                null) {
                                                              return true;
                                                            } else {
                                                              return false;
                                                            }
                                                          }(),
                                                          false,
                                                        ))
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await actions
                                                                  .abrirLinkedin(
                                                                getJsonField(
                                                                  listaGiantsItem,
                                                                  r'''$.linkedin''',
                                                                ).toString(),
                                                              );
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .linkedinIn,
                                                              color:
                                                                  Colors.white,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (getJsonField(
                                                              listaGiantsItem,
                                                              r'''$.fotos''',
                                                            ) !=
                                                            null)
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'GiantsFotos',
                                                                queryParameters:
                                                                    {
                                                                  'pesId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      listaGiantsItem,
                                                                      r'''$.pes_id''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'pesNome':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      listaGiantsItem,
                                                                      r'''$.nome''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            600),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .images,
                                                              color:
                                                                  Colors.white,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().UsrClass == 4)
                  Expanded(
                    flex: 10,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 180.0, 0.0, 0.0),
                            child: Text(
                              'Entre em contato com a equipe RBI Acelerador empresárial',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Giantas Denton',
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
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
