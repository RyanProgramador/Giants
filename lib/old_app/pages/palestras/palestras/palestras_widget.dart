import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/old_app/pages/palestras/modal_palestra/modal_palestra_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'palestras_model.dart';
export 'palestras_model.dart';

class PalestrasWidget extends StatefulWidget {
  const PalestrasWidget({Key? key}) : super(key: key);

  @override
  _PalestrasWidgetState createState() => _PalestrasWidgetState();
}

class _PalestrasWidgetState extends State<PalestrasWidget>
    with TickerProviderStateMixin {
  late PalestrasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PalestrasModel());
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
                              30.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Palestras',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Giantas Denton',
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              SizedBox(
                                width: 200.0,
                                child: Divider(
                                  height: 0.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 30.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed(
                                'PalestrasPesquisaNome',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 24.0,
                            ),
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
                      color: Colors.transparent,
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 30.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('Favoritos',
                                            FontAwesomeIcons.solidStar),
                                        ChipData('Populares'),
                                        ChipData('Todos'),
                                        ChipData('Gestão'),
                                        ChipData('Growth day by giants'),
                                        ChipData('Inovação'),
                                        ChipData('Liderança'),
                                        ChipData('Marketing'),
                                        ChipData('Vendas'),
                                        ChipData('Empreendedorismo'),
                                        ChipData('Finanças')
                                      ],
                                      onChanged: (val) => setState(() =>
                                          _model.choiceChipsValue = val?.first),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Color(0xFF2A2A2A),
                                            ),
                                        iconColor: Color(0xFF212121),
                                        iconSize: 18.0,
                                        elevation: 4.0,
                                        borderColor: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Colors.black,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: Color(0xFF4A4A4A),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      chipSpacing: 5.0,
                                      rowSpacing: 0.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceChipsValue != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                        ['Populares'],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if ((_model.choiceChipsValue != 'Favoritos') &&
                            (MediaQuery.sizeOf(context).width < 450.0))
                          Expanded(
                            flex: 14,
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0x002F2F2F),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: ListaPalestrasBancoDeDadosCall.call(
                                      categoriaId: _model.choiceChipsValue,
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
                                      final listViewListaPalestrasBancoDeDadosResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final teste =
                                              ListaPalestrasBancoDeDadosCall
                                                      .dadosListaPalestraBD(
                                                    listViewListaPalestrasBancoDeDadosResponse
                                                        .jsonBody,
                                                  )?.toList() ??
                                                  [];
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: teste.length,
                                            itemBuilder: (context, testeIndex) {
                                              final testeItem =
                                                  teste[testeIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ModalPalestraWidget(
                                                              urlVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..link''',
                                                              ).toString(),
                                                              tituloVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..nome''',
                                                              ).toString(),
                                                              descricaoVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..descricao''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 95.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x000F0F0F),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 6,
                                                          child: ClipRRect(
                                                            child: Container(
                                                              width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <=
                                                                      550.0
                                                                  ? 80.0
                                                                  : double
                                                                      .infinity,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    child: custom_widgets
                                                                        .HtmlImageLink(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        testeItem,
                                                                        r'''$..img''',
                                                                      ).toString(),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.91,
                                                                            -0.98),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState()
                                                                              .addToPalestrasFavoritas(PalestrasFavoritadasStruct(
                                                                            id: getJsonField(
                                                                              testeItem,
                                                                              r'''$.id_palestra''',
                                                                            ).toString(),
                                                                          ));
                                                                        });
                                                                      },
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidStar,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (functions.compareListas(
                                                                          getJsonField(
                                                                            testeItem,
                                                                            r'''$.id_palestra''',
                                                                          ).toString(),
                                                                          FFAppState().PalestrasFavoritas.toList()) ??
                                                                      true)
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.91,
                                                                          -0.98),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().removeFromPalestrasFavoritas(PalestrasFavoritadasStruct(
                                                                              id: getJsonField(
                                                                                testeItem,
                                                                                r'''$.id_palestra''',
                                                                              ).toString(),
                                                                            ));
                                                                          });
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidStar,
                                                                          color:
                                                                              Color(0xFFDFDFDF),
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 8,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    testeItem,
                                                                    r'''$..nome''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            63,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Giantas Denton',
                                                                        fontSize:
                                                                            16.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                          ),
                        if ((_model.choiceChipsValue != 'Favoritos') &&
                            (MediaQuery.sizeOf(context).width > 450.0))
                          Expanded(
                            flex: 14,
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0x002F2F2F),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: ListaPalestrasBancoDeDadosCall.call(
                                      categoriaId: _model.choiceChipsValue,
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
                                      final listViewListaPalestrasBancoDeDadosResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final teste =
                                              ListaPalestrasBancoDeDadosCall
                                                      .dadosListaPalestraBD(
                                                    listViewListaPalestrasBancoDeDadosResponse
                                                        .jsonBody,
                                                  )?.toList() ??
                                                  [];
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: teste.length,
                                            itemBuilder: (context, testeIndex) {
                                              final testeItem =
                                                  teste[testeIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ModalPalestraWidget(
                                                              urlVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..link''',
                                                              ).toString(),
                                                              tituloVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..nome''',
                                                              ).toString(),
                                                              descricaoVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..descricao''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 213.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x000F0F0F),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: ClipRRect(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    child: custom_widgets
                                                                        .HtmlImageLink(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        testeItem,
                                                                        r'''$..img''',
                                                                      ).toString(),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.91,
                                                                            -0.98),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState()
                                                                              .addToPalestrasFavoritas(PalestrasFavoritadasStruct(
                                                                            id: getJsonField(
                                                                              testeItem,
                                                                              r'''$.id_palestra''',
                                                                            ).toString(),
                                                                          ));
                                                                        });
                                                                      },
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidStar,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (functions.compareListas(
                                                                          getJsonField(
                                                                            testeItem,
                                                                            r'''$.id_palestra''',
                                                                          ).toString(),
                                                                          FFAppState().PalestrasFavoritas.toList()) ??
                                                                      true)
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.91,
                                                                          -0.98),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().removeFromPalestrasFavoritas(PalestrasFavoritadasStruct(
                                                                              id: getJsonField(
                                                                                testeItem,
                                                                                r'''$.id_palestra''',
                                                                              ).toString(),
                                                                            ));
                                                                          });
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidStar,
                                                                          color:
                                                                              Color(0xFFDFDFDF),
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 8,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    testeItem,
                                                                    r'''$..nome''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            63,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Giantas Denton',
                                                                        fontSize:
                                                                            25.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                          ),
                        if ((_model.choiceChipsValue == 'Favoritos') &&
                            (MediaQuery.sizeOf(context).width < 450.0))
                          Expanded(
                            flex: 14,
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 30.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: ListaPalestrasBancoDeDadosCall.call(
                                    categoriaId: _model.choiceChipsValue,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewListaPalestrasBancoDeDadosResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final teste =
                                            ListaPalestrasBancoDeDadosCall
                                                    .dadosListaPalestraBD(
                                                  listViewListaPalestrasBancoDeDadosResponse
                                                      .jsonBody,
                                                )?.toList() ??
                                                [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: teste.length,
                                          itemBuilder: (context, testeIndex) {
                                            final testeItem = teste[testeIndex];
                                            return Visibility(
                                              visible: functions.compareListas(
                                                      getJsonField(
                                                        testeItem,
                                                        r'''$.id_palestra''',
                                                      ).toString(),
                                                      FFAppState()
                                                          .PalestrasFavoritas
                                                          .toList()) ??
                                                  true,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ModalPalestraWidget(
                                                              urlVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..link''',
                                                              ).toString(),
                                                              tituloVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..nome''',
                                                              ).toString(),
                                                              descricaoVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..descricao''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 95.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x000F0F0F),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 6,
                                                          child: ClipRRect(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child: custom_widgets
                                                                    .HtmlImageLink(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  imageUrl:
                                                                      getJsonField(
                                                                    testeItem,
                                                                    r'''$..img''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 8,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    testeItem,
                                                                    r'''$..nome''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
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
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
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
                        if ((_model.choiceChipsValue == 'Favoritos') &&
                            (MediaQuery.sizeOf(context).width > 450.0))
                          Expanded(
                            flex: 14,
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 30.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: ListaPalestrasBancoDeDadosCall.call(
                                    categoriaId: _model.choiceChipsValue,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewListaPalestrasBancoDeDadosResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final teste =
                                            ListaPalestrasBancoDeDadosCall
                                                    .dadosListaPalestraBD(
                                                  listViewListaPalestrasBancoDeDadosResponse
                                                      .jsonBody,
                                                )?.toList() ??
                                                [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: teste.length,
                                          itemBuilder: (context, testeIndex) {
                                            final testeItem = teste[testeIndex];
                                            return Visibility(
                                              visible: functions.compareListas(
                                                      getJsonField(
                                                        testeItem,
                                                        r'''$.id_palestra''',
                                                      ).toString(),
                                                      FFAppState()
                                                          .PalestrasFavoritas
                                                          .toList()) ??
                                                  true,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ModalPalestraWidget(
                                                              urlVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..link''',
                                                              ).toString(),
                                                              tituloVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..nome''',
                                                              ).toString(),
                                                              descricaoVideo:
                                                                  getJsonField(
                                                                testeItem,
                                                                r'''$..descricao''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 213.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x000F0F0F),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: ClipRRect(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child: custom_widgets
                                                                    .HtmlImageLink(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  imageUrl:
                                                                      getJsonField(
                                                                    testeItem,
                                                                    r'''$..img''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 8,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    testeItem,
                                                                    r'''$..nome''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Giantas Denton',
                                                                        fontSize:
                                                                            25.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
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
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ),
        ),
      ),
    );
  }
}
