import '/backend/api_requests/api_calls.dart';
import '/components/error404_noting_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/pages/eventos/modal_evento/modal_evento_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inicio_model.dart';
export 'inicio_model.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({super.key});

  @override
  State<InicioWidget> createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  late InicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InicioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apicallListarEventos = await ListarEventosCall.call(
        pesId: FFAppState().usrID,
      );
      if ((_model.apicallListarEventos?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().eventosLitados = getJsonField(
            (_model.apicallListarEventos?.jsonBody ?? ''),
            r'''$.dados[?(@.destaque == 1)]''',
            true,
          )!
              .toList()
              .cast<dynamic>();
          FFAppState().eventosListadosDestaqueDois = getJsonField(
            (_model.apicallListarEventos?.jsonBody ?? ''),
            r'''$.dados[?(@.destaque == 2)]''',
            true,
          )!
              .toList()
              .cast<dynamic>();
        });
        return;
      } else {
        return;
      }
    });
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
                if (MediaQuery.sizeOf(context).width < 450.0)
                  Expanded(
                    flex: 10,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 8.0, 30.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(0.0),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final carrocel1 = FFAppState()
                                          .eventosLitados
                                          .map((e) => e)
                                          .toList();
                                      return Container(
                                        width: double.infinity,
                                        height: 101.0,
                                        child: CarouselSlider.builder(
                                          itemCount: carrocel1.length,
                                          itemBuilder:
                                              (context, carrocel1Index, _) {
                                            final carrocel1Item =
                                                carrocel1[carrocel1Index];
                                            return Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
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
                                                              carrocel1Item,
                                                              r'''$.descricao''',
                                                            ).toString(),
                                                            exclusivoGiatnts:
                                                                true,
                                                            dataEvento:
                                                                getJsonField(
                                                              carrocel1Item,
                                                              r'''$.data''',
                                                            ).toString(),
                                                            localEvento:
                                                                getJsonField(
                                                              carrocel1Item,
                                                              r'''$.local''',
                                                            ).toString(),
                                                            sobreEvento:
                                                                getJsonField(
                                                              carrocel1Item,
                                                              r'''$.sobre''',
                                                            ).toString(),
                                                            fotoBase64:
                                                                getJsonField(
                                                              carrocel1Item,
                                                              r'''$.banner''',
                                                            ).toString(),
                                                            dataEventoFim:
                                                                getJsonField(
                                                              carrocel1Item,
                                                              r'''$.dataFim''',
                                                            ).toString(),
                                                            idEvento:
                                                                getJsonField(
                                                              carrocel1Item,
                                                              r'''$.id''',
                                                            ).toString(),
                                                            jaIngressou:
                                                                getJsonField(
                                                                          carrocel1Item,
                                                                          r'''$.ja_inscrito''',
                                                                        ) !=
                                                                        null
                                                                    ? true
                                                                    : false,
                                                            evenOuImer:
                                                                getJsonField(
                                                              carrocel1Item,
                                                              r'''$.even_ou_imer''',
                                                            ).toString(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x002F2F2F),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x002F2F2F),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            child: custom_widgets
                                                                .HtmlImageCopyCopy(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              base64Image:
                                                                  valueOrDefault<
                                                                      String>(
                                                                getJsonField(
                                                                          carrocel1Item,
                                                                          r'''$.banner''',
                                                                        ) !=
                                                                        null
                                                                    ? getJsonField(
                                                                        carrocel1Item,
                                                                        r'''$.banner''',
                                                                      ).toString()
                                                                    : 'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC',
                                                                'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Opacity(
                                                        opacity: 0.0,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.01, -0.99),
                                                          child: Container(
                                                            width: 37.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.13,
                                                                          -0.82),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .solidBookmark,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 40.0,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.16,
                                                                          -0.59),
                                                                  child: Icon(
                                                                    Icons
                                                                        .star_sharp,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.07, 0.84),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Flexible(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        carrocel1Item,
                                                                        r'''$.descricao''',
                                                                      ).toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Giantas Denton',
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        'E. dd MMM • HH:mm',
                                                                        functions
                                                                            .strDataParaDateTime(getJsonField(
                                                                          carrocel1Item,
                                                                          r'''$.data''',
                                                                        ).toString()),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFFD0D0D0),
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                    ),
                                                                  ],
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
                                          carouselController:
                                              _model.carouselController1 ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage:
                                                min(1, carrocel1.length - 1),
                                            viewportFraction: 1.0,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 800),
                                            autoPlayInterval: Duration(
                                                milliseconds: (800 + 4000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex1 = index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: ListarEventosCall.call(
                                            pesId: FFAppState().usrID,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnListarEventosResponse =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 0.0,
                                                                30.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final gridListar =
                                                            getJsonField(
                                                          columnListarEventosResponse
                                                              .jsonBody,
                                                          r'''$.dados[?(@.destaque == 2)]''',
                                                        ).toList();
                                                        return GridView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                10.0,
                                                            mainAxisSpacing:
                                                                10.0,
                                                            childAspectRatio:
                                                                1.0,
                                                          ),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              gridListar.length,
                                                          itemBuilder: (context,
                                                              gridListarIndex) {
                                                            final gridListarItem =
                                                                gridListar[
                                                                    gridListarIndex];
                                                            return Container(
                                                              width: 150.0,
                                                              height: 150.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                ModalEventoWidget(
                                                                              nomeTitulo: getJsonField(
                                                                                gridListarItem,
                                                                                r'''$.descricao''',
                                                                              ).toString(),
                                                                              exclusivoGiatnts: true,
                                                                              dataEvento: getJsonField(
                                                                                gridListarItem,
                                                                                r'''$.data''',
                                                                              ).toString(),
                                                                              localEvento: getJsonField(
                                                                                gridListarItem,
                                                                                r'''$.local''',
                                                                              ).toString(),
                                                                              sobreEvento: 'teste',
                                                                              fotoBase64: getJsonField(
                                                                                gridListarItem,
                                                                                r'''$.banner''',
                                                                              ).toString(),
                                                                              dataEventoFim: getJsonField(
                                                                                gridListarItem,
                                                                                r'''$.dataFim''',
                                                                              ).toString(),
                                                                              idEvento: getJsonField(
                                                                                gridListarItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                              jaIngressou: getJsonField(
                                                                                        gridListarItem,
                                                                                        r'''$.ja_inscrito''',
                                                                                      ) !=
                                                                                      null
                                                                                  ? true
                                                                                  : false,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 100.0,
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, -1.0),
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          height: double.infinity,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: double.infinity,
                                                                                            child: custom_widgets.HtmlImageCopyCopy(
                                                                                              width: double.infinity,
                                                                                              height: double.infinity,
                                                                                              base64Image: valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                          gridListarItem,
                                                                                                          r'''$.banner''',
                                                                                                        ) !=
                                                                                                        null
                                                                                                    ? getJsonField(
                                                                                                        gridListarItem,
                                                                                                        r'''$.banner''',
                                                                                                      ).toString()
                                                                                                    : 'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC',
                                                                                                'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    gridListarItem,
                                                                                                    r'''$.descricao''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Giantas Denton',
                                                                                                        color: Colors.white,
                                                                                                        fontSize: 16.0,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat(
                                                                                                    'E. dd MMM • HH:mm',
                                                                                                    functions.strDataParaDateTime(getJsonField(
                                                                                                      gridListarItem,
                                                                                                      r'''$.data''',
                                                                                                    ).toString()),
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Open Sans',
                                                                                                        color: Color(0xFFD0D0D0),
                                                                                                        fontSize: 14.0,
                                                                                                        fontWeight: FontWeight.normal,
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
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
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
                if (MediaQuery.sizeOf(context).width > 450.0)
                  Expanded(
                    flex: 10,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 8.0, 30.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: ListarEventosCall.call(
                                    pesId: FFAppState().usrID,
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
                                    final containerListarEventosResponse =
                                        snapshot.data!;
                                    return Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final carrocel2 = FFAppState()
                                              .eventosLitados
                                              .map((e) => e)
                                              .toList();
                                          return Container(
                                            width: double.infinity,
                                            height: 101.0,
                                            child: CarouselSlider.builder(
                                              itemCount: carrocel2.length,
                                              itemBuilder:
                                                  (context, carrocel2Index, _) {
                                                final carrocel2Item =
                                                    carrocel2[carrocel2Index];
                                                return Builder(
                                                  builder: (context) => InkWell(
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
                                                        builder:
                                                            (dialogContext) {
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
                                                                  carrocel2Item,
                                                                  r'''$.descricao''',
                                                                ).toString(),
                                                                exclusivoGiatnts:
                                                                    true,
                                                                dataEvento:
                                                                    getJsonField(
                                                                  carrocel2Item,
                                                                  r'''$.data''',
                                                                ).toString(),
                                                                localEvento:
                                                                    getJsonField(
                                                                  carrocel2Item,
                                                                  r'''$.local''',
                                                                ).toString(),
                                                                sobreEvento:
                                                                    getJsonField(
                                                                  carrocel2Item,
                                                                  r'''$.sobre''',
                                                                ).toString(),
                                                                fotoBase64:
                                                                    getJsonField(
                                                                  carrocel2Item,
                                                                  r'''$.banner''',
                                                                ).toString(),
                                                                dataEventoFim:
                                                                    getJsonField(
                                                                  carrocel2Item,
                                                                  r'''$.dataFim''',
                                                                ).toString(),
                                                                idEvento:
                                                                    getJsonField(
                                                                  carrocel2Item,
                                                                  r'''$.id''',
                                                                ).toString(),
                                                                jaIngressou:
                                                                    getJsonField(
                                                                              carrocel2Item,
                                                                              r'''$.ja_inscrito''',
                                                                            ) !=
                                                                            null
                                                                        ? true
                                                                        : false,
                                                                evenOuImer: '',
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x002F2F2F),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x002F2F2F),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child: custom_widgets
                                                                    .HtmlImageCopyCopy(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  base64Image:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    getJsonField(
                                                                              carrocel2Item,
                                                                              r'''$.banner''',
                                                                            ) !=
                                                                            null
                                                                        ? getJsonField(
                                                                            carrocel2Item,
                                                                            r'''$.banner''',
                                                                          ).toString()
                                                                        : 'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC',
                                                                    'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Opacity(
                                                            opacity: 0.0,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.01,
                                                                      -0.99),
                                                              child: Container(
                                                                width: 37.0,
                                                                height: 45.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .transparent,
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.13,
                                                                          -0.82),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidBookmark,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            40.0,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.16,
                                                                          -0.59),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .star_sharp,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.07,
                                                                    0.84),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Flexible(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            carrocel2Item,
                                                                            r'''$.descricao''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Giantas Denton',
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            'E. dd MMM • HH:mm',
                                                                            functions.strDataParaDateTime(getJsonField(
                                                                              carrocel2Item,
                                                                              r'''$.data''',
                                                                            ).toString()),
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Open Sans',
                                                                                color: Color(0xFFD0D0D0),
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              carouselController:
                                                  _model.carouselController2 ??=
                                                      CarouselController(),
                                              options: CarouselOptions(
                                                initialPage: min(
                                                    1, carrocel2.length - 1),
                                                viewportFraction: 1.0,
                                                disableCenter: true,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.25,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: true,
                                                autoPlayAnimationDuration:
                                                    Duration(milliseconds: 800),
                                                autoPlayInterval: Duration(
                                                    milliseconds: (800 + 4000)),
                                                autoPlayCurve: Curves.linear,
                                                pauseAutoPlayInFiniteScroll:
                                                    true,
                                                onPageChanged: (index, _) =>
                                                    _model.carouselCurrentIndex2 =
                                                        index,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 0.0, 30.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final gridListarDois =
                                                        FFAppState()
                                                            .eventosListadosDestaqueDois
                                                            .map((e) => e)
                                                            .toList();
                                                    if (gridListarDois
                                                        .isEmpty) {
                                                      return Container(
                                                        width: double.infinity,
                                                        height: 200.0,
                                                        child:
                                                            Error404NotingWidget(),
                                                      );
                                                    }
                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 10.0,
                                                        mainAxisSpacing: 10.0,
                                                        childAspectRatio: 1.0,
                                                      ),
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          gridListarDois.length,
                                                      itemBuilder: (context,
                                                          gridListarDoisIndex) {
                                                        final gridListarDoisItem =
                                                            gridListarDois[
                                                                gridListarDoisIndex];
                                                        return Container(
                                                          width: 150.0,
                                                          height: 150.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder:
                                                                (context) =>
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
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            ModalEventoWidget(
                                                                          nomeTitulo:
                                                                              getJsonField(
                                                                            gridListarDoisItem,
                                                                            r'''$.descricao''',
                                                                          ).toString(),
                                                                          exclusivoGiatnts:
                                                                              true,
                                                                          dataEvento:
                                                                              getJsonField(
                                                                            gridListarDoisItem,
                                                                            r'''$.data''',
                                                                          ).toString(),
                                                                          localEvento:
                                                                              getJsonField(
                                                                            gridListarDoisItem,
                                                                            r'''$.local''',
                                                                          ).toString(),
                                                                          sobreEvento:
                                                                              'teste',
                                                                          fotoBase64:
                                                                              getJsonField(
                                                                            gridListarDoisItem,
                                                                            r'''$.banner''',
                                                                          ).toString(),
                                                                          dataEventoFim:
                                                                              getJsonField(
                                                                            gridListarDoisItem,
                                                                            r'''$.dataFim''',
                                                                          ).toString(),
                                                                          idEvento:
                                                                              getJsonField(
                                                                            gridListarDoisItem,
                                                                            r'''$.id''',
                                                                          ).toString(),
                                                                          jaIngressou: getJsonField(
                                                                                    gridListarDoisItem,
                                                                                    r'''$.ja_inscrito''',
                                                                                  ) !=
                                                                                  null
                                                                              ? true
                                                                              : false,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 100.0,
                                                                              height: 100.0,
                                                                              child: Stack(
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, -1.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      height: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        child: custom_widgets.HtmlImageCopyCopy(
                                                                                          width: double.infinity,
                                                                                          height: double.infinity,
                                                                                          base64Image: valueOrDefault<String>(
                                                                                            () {
                                                                                              if (getJsonField(
                                                                                                    gridListarDoisItem,
                                                                                                    r'''$.banner''',
                                                                                                  ) !=
                                                                                                  null) {
                                                                                                return getJsonField(
                                                                                                  gridListarDoisItem,
                                                                                                  r'''$.dados..banner''',
                                                                                                ).toString();
                                                                                              } else if (getJsonField(
                                                                                                    gridListarDoisItem,
                                                                                                    r'''$.dados..banner''',
                                                                                                  ) !=
                                                                                                  null) {
                                                                                                return getJsonField(
                                                                                                  gridListarDoisItem,
                                                                                                  r'''$.dados..banner''',
                                                                                                ).toString();
                                                                                              } else {
                                                                                                return 'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC';
                                                                                              }
                                                                                            }(),
                                                                                            'iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAANlBMVEXp7vG6vsHs8fS2ur3c4eTU2dzm6u3P1Ne4vL/u8/a4vL67v8G0ubzDx8rY3eDEyMvh5unKz9Izr04MAAADb0lEQVR4nO2c63KrIBRGFY1CY4x5/5c93nKiICZGGOvuWj86adowYc0HWxgxSQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOC3oiJwdJ/2oJr6Epy6Sc4qxeTXKtNPfoYfP9NXDj//f0xfv97oX2X6cU4l5pGl6TWNgdbF0b37AnPXUWwMVEd37wvqLKKQNnzm6A5uxcRMSEuWH93DrTRV/8XbaVBnQdFj9u4nm13Vpc+ILk3wy5FCn3LYqHL43hG+9ti0PqmRCNGO2HRMVJlGNqIx8mpakpEQyzRBRlSSd+u0vT0RY8Tkt6rq1mnXcl9fpBjp130DOt2Vk8HI9exG1G16VV81u5qWkBF7Ibxn6SrDSF5ZC7UdqxIRRoyzcZR9P25EGCnsiLRLwK87JMGIqt3NkjdL15VdQxFGSkfIm+v7Irt7jUmovm0f3B3o1Q7pVHuViMjIZeOo6aYdffP8hwQjSePuQq+U33Ee9ikRYcQ4tSar/Z996vMoEWHkue31wTSiJpV6WYkII4myjFS5rz/FdIAtKpFhxJpJqod3Xp3POEtKJFTf7vdGv2KSeYU4F7cLSoRkJFHJvRqcZDr3CnFrkntdIsVIW3CK8tam/ZEbb1+ckrSUEjlG2jeNUsbvw10PjimZf0KSkfVPLAyZxYHzV4woT0LcgSOk1rylWLu7YpaSv5KR9ftvpin5G0ZWhoyjRKIRU1tvF9XbO5JeSgQaMXU1nyrfJmSmRJ6RVkia3iZ/+CAhaVdcRiXijPRCpoPAex3iSYm06qvq+Q7ZZ0NmVDIxIiYjTyGdkv5vG4SINGIm9/32Kfl4yAg1YuppIlolWxIi0Yip7R2ybTdGizNiC9mMFlZr1O6zA8Iysjsh0oy0ZXf36SNRRsxlU1WRb8RcQpw/EmSkuw4JcGJPkJE6wJBJJVXfxXuMdho5d0YwkmDEBSM2GLGJboRaYxs5d0YSjNgZeVRBjoNXYowkTR6GsWkBRgI3jRG7aYzYTWPEbvqkRqI97sCc1MiwaaYfSRGa/JzPH3k+oyYNciEyZ2j4dE8Ac49vhmXHYdCjyOM+68p3QusXY8owm6uL6LPNqz0RlWTXozv3Haq5R5hXW66XMyakxwRb400p/IcNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4FD+AZS0NBe99dfKAAAAAElFTkSuQmCC',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              getJsonField(
                                                                                                gridListarDoisItem,
                                                                                                r'''$.descricao''',
                                                                                              ).toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Giantas Denton',
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 16.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              dateTimeFormat(
                                                                                                'E. dd MMM • HH:mm',
                                                                                                functions.strDataParaDateTime(getJsonField(
                                                                                                  gridListarDoisItem,
                                                                                                  r'''$.data''',
                                                                                                ).toString()),
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Open Sans',
                                                                                                    color: Color(0xFFD0D0D0),
                                                                                                    fontSize: 14.0,
                                                                                                    fontWeight: FontWeight.normal,
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
