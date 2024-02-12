import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/pages/eventos/modal_evento/modal_evento_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'imersoes_pesquisa_nome_model.dart';
export 'imersoes_pesquisa_nome_model.dart';

class ImersoesPesquisaNomeWidget extends StatefulWidget {
  const ImersoesPesquisaNomeWidget({super.key});

  @override
  State<ImersoesPesquisaNomeWidget> createState() =>
      _ImersoesPesquisaNomeWidgetState();
}

class _ImersoesPesquisaNomeWidgetState extends State<ImersoesPesquisaNomeWidget>
    with TickerProviderStateMixin {
  late ImersoesPesquisaNomeModel _model;

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
    _model = createModel(context, () => ImersoesPesquisaNomeModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed(
                                'Eventos',
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
                              Icons.arrow_back_sharp,
                              color: Colors.white,
                              size: 26.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 2000),
                              () async {
                                setState(
                                    () => _model.apiRequestCompleter = null);
                                await _model.waitForApiRequestCompleted();
                              },
                            ),
                            onFieldSubmitted: (_) async {
                              setState(() => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                  ),
                              hintText: 'Pesquisar...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() => _model.apiRequestCompleter = null);
                            await _model.waitForApiRequestCompleted();
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
                    color: Color(0xFF1B1C1D),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 14,
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(PesquisaEventoCall.call(
                                          termoPesquisa: _model.textController
                                                          .text !=
                                                      null &&
                                                  _model.textController.text !=
                                                      ''
                                              ? _model.textController.text
                                              : '',
                                          pesId: FFAppState().usrID,
                                        )))
                                  .future,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final listViewPesquisaEventoResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final listarEventos = getJsonField(
                                      listViewPesquisaEventoResponse.jsonBody,
                                      r'''$.dados''',
                                    ).toList();
                                    if (listarEventos.isEmpty) {
                                      return Image.asset(
                                        'assets/images/oops2-min.png',
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listarEventos.length,
                                      itemBuilder:
                                          (context, listarEventosIndex) {
                                        final listarEventosItem =
                                            listarEventos[listarEventosIndex];
                                        return Wrap(
                                          spacing: 0.0,
                                          runSpacing: 0.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 16.0, 8.0),
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
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
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
                                                            child:
                                                                ModalEventoWidget(
                                                              nomeTitulo:
                                                                  getJsonField(
                                                                listarEventosItem,
                                                                r'''$.descricao''',
                                                              ).toString(),
                                                              exclusivoGiatnts:
                                                                  true,
                                                              dataEvento:
                                                                  getJsonField(
                                                                listarEventosItem,
                                                                r'''$.data''',
                                                              ).toString(),
                                                              localEvento:
                                                                  getJsonField(
                                                                listarEventosItem,
                                                                r'''$.local''',
                                                              ).toString(),
                                                              sobreEvento:
                                                                  'teste',
                                                              fotoBase64:
                                                                  getJsonField(
                                                                listarEventosItem,
                                                                r'''$.banner''',
                                                              ).toString(),
                                                              dataEventoFim:
                                                                  getJsonField(
                                                                listarEventosItem,
                                                                r'''$.dataFim''',
                                                              ).toString(),
                                                              idEvento:
                                                                  getJsonField(
                                                                listarEventosItem,
                                                                r'''$.id''',
                                                              ).toString(),
                                                              jaIngressou:
                                                                  getJsonField(
                                                                            listarEventosItem,
                                                                            r'''$..ja_inscrito''',
                                                                          ) !=
                                                                          null
                                                                      ? true
                                                                      : false,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 150.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        200.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          100.0,
                                                                      child: custom_widgets
                                                                          .HtmlImageCopyCopy(
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            100.0,
                                                                        base64Image:
                                                                            valueOrDefault<String>(
                                                                          getJsonField(
                                                                                    listarEventosItem,
                                                                                    r'''$.banner''',
                                                                                  ) !=
                                                                                  null
                                                                              ? getJsonField(
                                                                                  listarEventosItem,
                                                                                  r'''$.banner''',
                                                                                ).toString()
                                                                              : 'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC',
                                                                          'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (getJsonField(
                                                                      listarEventosItem,
                                                                      r'''$..ja_inscrito''',
                                                                    ) !=
                                                                    null)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.81,
                                                                            1.39),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          37.0,
                                                                      height:
                                                                          45.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -0.4),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.userCheck,
                                                                              color: Color(0xFF32CD32),
                                                                              size: 30.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.01,
                                                                          -0.99),
                                                                  child:
                                                                      Container(
                                                                    width: 37.0,
                                                                    height:
                                                                        45.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .transparent,
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.63,
                                                                              -0.98),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidBookmark,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                40.0,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.32,
                                                                              -0.6),
                                                                          child:
                                                                              Icon(
                                                                            Icons.star_sharp,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            dateTimeFormat(
                                                                              'E. dd MMM • HH:mm',
                                                                              functions.strDataParaDateTime(getJsonField(
                                                                                listarEventosItem,
                                                                                r'''$.data''',
                                                                              ).toString()),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Open Sans',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              listarEventosItem,
                                                                              r'''$.descricao''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Open Sans',
                                                                                  fontSize: 16.0,
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
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
