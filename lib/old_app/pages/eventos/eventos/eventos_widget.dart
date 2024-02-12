import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/old_app/pages/eventos/modal_evento/modal_evento_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eventos_model.dart';
export 'eventos_model.dart';

class EventosWidget extends StatefulWidget {
  const EventosWidget({super.key});

  @override
  State<EventosWidget> createState() => _EventosWidgetState();
}

class _EventosWidgetState extends State<EventosWidget> {
  late EventosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.resultadoListaEventos = await ListarEventosCall.call();
      if (ListarEventosCall.statusListarEventos(
        (_model.resultadoListaEventos?.jsonBody ?? ''),
      )!) {
        setState(() {
          FFAppState().dataEventosLista = ListarEventosCall.dataListarEvento(
            (_model.resultadoListaEventos?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
        });
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
                      color: Color(0x00060606),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Eventos',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Giantas Denton',
                                        fontSize: 26.0,
                                        useGoogleFonts: false,
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
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('EventoPesquisaNome');
                                  },
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 22.0,
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData(
                                      'Favoritos', FontAwesomeIcons.solidStar),
                                  ChipData('Inscritos',
                                      FontAwesomeIcons.calendarCheck),
                                  ChipData('Todos', FontAwesomeIcons.alignLeft)
                                ],
                                onChanged: (val) => setState(
                                    () => _model.choiceChipsValue = val?.first),
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
                                  borderRadius: BorderRadius.circular(0.0),
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
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                chipSpacing: 5.0,
                                rowSpacing: 0.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  ['Todos'],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if ((_model.choiceChipsValue == 'Todos') &&
                            (MediaQuery.sizeOf(context).width < 450.0))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 45.0),
                            child: ClipRRect(
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                decoration: BoxDecoration(
                                  color: Color(0x002F2F2F),
                                ),
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
                                    final listViewListarEventosResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final listarEventos = ListarEventosCall
                                                .dadosListarEventos(
                                              listViewListarEventosResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listarEventos.length,
                                          itemBuilder:
                                              (context, listarEventosIndex) {
                                            final listarEventosItem =
                                                listarEventos[
                                                    listarEventosIndex];
                                            return Container(
                                              width: 100.0,
                                              height: 121.0,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  30.0,
                                                                  8.0,
                                                                  30.0,
                                                                  8.0),
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
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
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
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
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
                                                                    jaIngressou: getJsonField(
                                                                              listarEventosItem,
                                                                              r'''$..ja_inscrito''',
                                                                            ) !=
                                                                            null
                                                                        ? true
                                                                        : false,
                                                                    evenOuImer:
                                                                        getJsonField(
                                                                      listarEventosItem,
                                                                      r'''$.even_ou_imer''',
                                                                    ).toString(),
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
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 150.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                100.0,
                                                                            child:
                                                                                custom_widgets.HtmlImageCopyCopy(
                                                                              width: 200.0,
                                                                              height: 100.0,
                                                                              base64Image: valueOrDefault<String>(
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
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              31.0,
                                                                          height:
                                                                              30.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.transparent,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.calendarCheck,
                                                                                color: valueOrDefault<Color>(
                                                                                  getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$..ja_inscrito''',
                                                                                          ) !=
                                                                                          null
                                                                                      ? Color(0xFFD0D0D0)
                                                                                      : Color(0xFF252525),
                                                                                  Color(0xFF252525),
                                                                                ),
                                                                                size: 22.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.52,
                                                                            -1.01),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                31.0,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.transparent,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    setState(() {
                                                                                      FFAppState().addToEventosFavoritos(EventosFavoritadosStruct(
                                                                                        eventoOuImersao: getJsonField(
                                                                                          listarEventosItem,
                                                                                          r'''$.even_ou_imer''',
                                                                                        ).toString(),
                                                                                        eventoImersID: getJsonField(
                                                                                          listarEventosItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                      ));
                                                                                    });
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.star_sharp,
                                                                                    color: Color(0xFF161616),
                                                                                    size: 22.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (functions.compareDuasListas(
                                                                              getJsonField(
                                                                                listarEventosItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                              getJsonField(
                                                                                listarEventosItem,
                                                                                r'''$.even_ou_imer''',
                                                                              ).toString(),
                                                                              FFAppState().EventosFavoritos.toList()) ==
                                                                          true)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.52,
                                                                              -1.01),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 31.0,
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      setState(() {
                                                                                        FFAppState().removeFromEventosFavoritos(EventosFavoritadosStruct(
                                                                                          eventoImersID: getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                          eventoOuImersao: getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$.even_ou_imer''',
                                                                                          ).toString(),
                                                                                        ));
                                                                                      });
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.star_sharp,
                                                                                      color: Color(0xFFD0D0D0),
                                                                                      size: 22.0,
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
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x000A0A0A),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(4.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
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
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  getJsonField(
                                                                                    listarEventosItem,
                                                                                    r'''$.descricao''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Giantas Denton',
                                                                                        color: Colors.white,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
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
                                                                                        fontFamily: 'Giantas Denton',
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: false,
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
                        if ((_model.choiceChipsValue == 'Todos') &&
                            (MediaQuery.sizeOf(context).width > 450.0))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 45.0),
                            child: ClipRRect(
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                decoration: BoxDecoration(
                                  color: Color(0x002F2F2F),
                                ),
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
                                    final listViewListarEventosResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final listarEventos = ListarEventosCall
                                                .dadosListarEventos(
                                              listViewListarEventosResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listarEventos.length,
                                          itemBuilder:
                                              (context, listarEventosIndex) {
                                            final listarEventosItem =
                                                listarEventos[
                                                    listarEventosIndex];
                                            return Container(
                                              width: 100.0,
                                              height: 213.0,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: Builder(
                                                builder: (context) => Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 8.0, 30.0, 8.0),
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
                                                                evenOuImer:
                                                                    getJsonField(
                                                                  listarEventosItem,
                                                                  r'''$.even_ou_imer''',
                                                                ).toString(),
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
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 5,
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            child:
                                                                                custom_widgets.HtmlImageCopyCopy(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              base64Image: valueOrDefault<String>(
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
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              31.0,
                                                                          height:
                                                                              30.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.transparent,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.calendarCheck,
                                                                                color: valueOrDefault<Color>(
                                                                                  getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$..ja_inscrito''',
                                                                                          ) !=
                                                                                          null
                                                                                      ? Color(0xFFD0D0D0)
                                                                                      : Color(0xFF252525),
                                                                                  Color(0xFF252525),
                                                                                ),
                                                                                size: 22.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.52,
                                                                            -1.01),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                31.0,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.transparent,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    setState(() {
                                                                                      FFAppState().addToEventosFavoritos(EventosFavoritadosStruct(
                                                                                        eventoOuImersao: getJsonField(
                                                                                          listarEventosItem,
                                                                                          r'''$.even_ou_imer''',
                                                                                        ).toString(),
                                                                                        eventoImersID: getJsonField(
                                                                                          listarEventosItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                      ));
                                                                                    });
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.star_sharp,
                                                                                    color: Color(0xFF161616),
                                                                                    size: 22.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (functions.compareDuasListas(
                                                                              getJsonField(
                                                                                listarEventosItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                              getJsonField(
                                                                                listarEventosItem,
                                                                                r'''$.even_ou_imer''',
                                                                              ).toString(),
                                                                              FFAppState().EventosFavoritos.toList()) ==
                                                                          true)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.52,
                                                                              -1.01),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 31.0,
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      setState(() {
                                                                                        FFAppState().removeFromEventosFavoritos(EventosFavoritadosStruct(
                                                                                          eventoImersID: getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                          eventoOuImersao: getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$.even_ou_imer''',
                                                                                          ).toString(),
                                                                                        ));
                                                                                      });
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.star_sharp,
                                                                                      color: Color(0xFFD0D0D0),
                                                                                      size: 22.0,
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
                                                              Expanded(
                                                                flex: 8,
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x000A0A0A),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0.0),
                                                                      topRight:
                                                                          Radius.circular(
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
                                                                                getJsonField(
                                                                                  listarEventosItem,
                                                                                  r'''$.descricao''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Giantas Denton',
                                                                                      color: Colors.white,
                                                                                      fontSize: 28.0,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
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
                                                                                      fontFamily: 'Giantas Denton',
                                                                                      color: Colors.white,
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: false,
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
                        if ((_model.choiceChipsValue == 'Inscritos') &&
                            (MediaQuery.sizeOf(context).width < 450.0) &&
                            (FFAppState().UsrClass != '5'))
                          Expanded(
                            flex: 10,
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: ListaEventosInscritosCall.call(
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
                                  final listViewListaEventosInscritosResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final listarEventos =
                                          ListaEventosInscritosCall
                                                  .dadosListaEventosInscritos(
                                                listViewListaEventosInscritosResponse
                                                    .jsonBody,
                                              )?.toList() ??
                                              [];
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
                                                          30.0, 8.0, 30.0, 8.0),
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
                                                                    true,
                                                                evenOuImer:
                                                                    getJsonField(
                                                                  listarEventosItem,
                                                                  r'''$.even_ou_imer''',
                                                                ).toString(),
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
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              100.0,
                                                                          child:
                                                                              custom_widgets.HtmlImageCopyCopy(
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
                                                                  color: Colors
                                                                      .transparent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
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
                                                                              getJsonField(
                                                                                listarEventosItem,
                                                                                r'''$.descricao''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Giantas Denton',
                                                                                    fontSize: 16.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
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
                                                                                    color: Color(0xFFE8E8E8),
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.normal,
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
                        if ((_model.choiceChipsValue == 'Inscritos') &&
                            (FFAppState().UsrClass == '5'))
                          Expanded(
                            flex: 10,
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                'Nenhuma inscrição',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Giantas Denton',
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        if ((_model.choiceChipsValue == 'Inscritos') &&
                            (FFAppState().UsrClass == '4'))
                          Expanded(
                            flex: 10,
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                'Entre em contato com o grupo RBI acelerador empresárial para se tornar um membro',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Giantas Denton',
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        if ((_model.choiceChipsValue == 'Inscritos') &&
                            (MediaQuery.sizeOf(context).width > 450.0) &&
                            (FFAppState().UsrClass != '5'))
                          Expanded(
                            flex: 10,
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: ListaEventosInscritosCall.call(
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
                                  final listViewListaEventosInscritosResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final listarEventos =
                                          ListaEventosInscritosCall
                                                  .dadosListaEventosInscritos(
                                                listViewListaEventosInscritosResponse
                                                    .jsonBody,
                                              )?.toList() ??
                                              [];
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listarEventos.length,
                                        itemBuilder:
                                            (context, listarEventosIndex) {
                                          final listarEventosItem =
                                              listarEventos[listarEventosIndex];
                                          return Container(
                                            width: double.infinity,
                                            height: 213.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x002F2F2F),
                                            ),
                                            child: Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 8.0, 30.0, 8.0),
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
                                                              jaIngressou: true,
                                                              evenOuImer:
                                                                  getJsonField(
                                                                listarEventosItem,
                                                                r'''$.even_ou_imer''',
                                                              ).toString(),
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
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 5,
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            child:
                                                                                custom_widgets.HtmlImageCopyCopy(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              base64Image: valueOrDefault<String>(
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
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 8,
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .transparent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
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
                                                                              getJsonField(
                                                                                listarEventosItem,
                                                                                r'''$.descricao''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Giantas Denton',
                                                                                    color: Colors.white,
                                                                                    fontSize: 28.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
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
                                                                                    color: Color(0xFFE8E8E8),
                                                                                    fontSize: 18.0,
                                                                                    fontWeight: FontWeight.normal,
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
                        if ((_model.choiceChipsValue == 'Favoritos') &&
                            (MediaQuery.sizeOf(context).width < 450.0))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 45.0),
                            child: ClipRRect(
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                decoration: BoxDecoration(
                                  color: Color(0x002F2F2F),
                                ),
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
                                    final listViewListarEventosResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final listarEventos = ListarEventosCall
                                                .dadosListarEventos(
                                              listViewListarEventosResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listarEventos.length,
                                          itemBuilder:
                                              (context, listarEventosIndex) {
                                            final listarEventosItem =
                                                listarEventos[
                                                    listarEventosIndex];
                                            return Visibility(
                                              visible:
                                                  functions.compareDuasListas(
                                                          getJsonField(
                                                            listarEventosItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          getJsonField(
                                                            listarEventosItem,
                                                            r'''$.even_ou_imer''',
                                                          ).toString(),
                                                          FFAppState()
                                                              .EventosFavoritos
                                                              .toList()) ==
                                                      true,
                                              child: Container(
                                                width: 100.0,
                                                height: 121.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    30.0,
                                                                    8.0,
                                                                    30.0,
                                                                    8.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
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
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
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
                                                                      jaIngressou: getJsonField(
                                                                                listarEventosItem,
                                                                                r'''$..ja_inscrito''',
                                                                              ) !=
                                                                              null
                                                                          ? true
                                                                          : false,
                                                                      evenOuImer:
                                                                          getJsonField(
                                                                        listarEventosItem,
                                                                        r'''$.even_ou_imer''',
                                                                      ).toString(),
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                            child:
                                                                                Container(
                                                                              width: 200.0,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: 200.0,
                                                                                height: 100.0,
                                                                                child: custom_widgets.HtmlImageCopyCopy(
                                                                                  width: 200.0,
                                                                                  height: 100.0,
                                                                                  base64Image: valueOrDefault<String>(
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
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.94,
                                                                              -1.02),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 31.0,
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.calendarCheck,
                                                                                    color: valueOrDefault<Color>(
                                                                                      getJsonField(
                                                                                                listarEventosItem,
                                                                                                r'''$..ja_inscrito''',
                                                                                              ) !=
                                                                                              null
                                                                                          ? Color(0xFFD0D0D0)
                                                                                          : Color(0xFF2A2A2A),
                                                                                      Color(0x940C0C0C),
                                                                                    ),
                                                                                    size: 22.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.52,
                                                                              -1.01),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 31.0,
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      setState(() {
                                                                                        FFAppState().addToEventosFavoritos(EventosFavoritadosStruct(
                                                                                          eventoOuImersao: getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$.even_ou_imer''',
                                                                                          ).toString(),
                                                                                          eventoImersID: getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                        ));
                                                                                      });
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.star_sharp,
                                                                                      color: Color(0xFF161616),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (functions.compareDuasListas(
                                                                                getJsonField(
                                                                                  listarEventosItem,
                                                                                  r'''$.id''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  listarEventosItem,
                                                                                  r'''$.even_ou_imer''',
                                                                                ).toString(),
                                                                                FFAppState().EventosFavoritos.toList()) ==
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.52, -1.01),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 31.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        setState(() {
                                                                                          FFAppState().removeFromEventosFavoritos(EventosFavoritadosStruct(
                                                                                            eventoImersID: getJsonField(
                                                                                              listarEventosItem,
                                                                                              r'''$.id''',
                                                                                            ).toString(),
                                                                                            eventoOuImersao: getJsonField(
                                                                                              listarEventosItem,
                                                                                              r'''$.even_ou_imer''',
                                                                                            ).toString(),
                                                                                          ));
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.star_sharp,
                                                                                        color: Color(0xFFD0D0D0),
                                                                                        size: 22.0,
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
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x000A0A0A),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(4.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      listarEventosItem,
                                                                                      r'''$.descricao''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Giantas Denton',
                                                                                          color: Colors.white,
                                                                                          fontSize: 16.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
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
                                                                                          fontFamily: 'Giantas Denton',
                                                                                          color: Colors.white,
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: false,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 45.0),
                            child: ClipRRect(
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                decoration: BoxDecoration(
                                  color: Color(0x002F2F2F),
                                ),
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
                                    final listViewListarEventosResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final listarEventos = ListarEventosCall
                                                .dadosListarEventos(
                                              listViewListarEventosResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listarEventos.length,
                                          itemBuilder:
                                              (context, listarEventosIndex) {
                                            final listarEventosItem =
                                                listarEventos[
                                                    listarEventosIndex];
                                            return Visibility(
                                              visible:
                                                  functions.compareDuasListas(
                                                          getJsonField(
                                                            listarEventosItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          getJsonField(
                                                            listarEventosItem,
                                                            r'''$.even_ou_imer''',
                                                          ).toString(),
                                                          FFAppState()
                                                              .EventosFavoritos
                                                              .toList()) ==
                                                      true,
                                              child: Container(
                                                width: 100.0,
                                                height: 213.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 8.0,
                                                                30.0, 8.0),
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
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
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
                                                                        .requestFocus(_model
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
                                                                  evenOuImer:
                                                                      getJsonField(
                                                                    listarEventosItem,
                                                                    r'''$.even_ou_imer''',
                                                                  ).toString(),
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
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  flex: 5,
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                child: custom_widgets.HtmlImageCopyCopy(
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  base64Image: valueOrDefault<String>(
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
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.94,
                                                                              -1.02),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 31.0,
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.calendarCheck,
                                                                                    color: valueOrDefault<Color>(
                                                                                      getJsonField(
                                                                                                listarEventosItem,
                                                                                                r'''$..ja_inscrito''',
                                                                                              ) !=
                                                                                              null
                                                                                          ? Color(0xFFD0D0D0)
                                                                                          : Color(0xFF2A2A2A),
                                                                                      Color(0x940C0C0C),
                                                                                    ),
                                                                                    size: 22.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.52,
                                                                              -1.01),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 31.0,
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      setState(() {
                                                                                        FFAppState().addToEventosFavoritos(EventosFavoritadosStruct(
                                                                                          eventoOuImersao: getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$.even_ou_imer''',
                                                                                          ).toString(),
                                                                                          eventoImersID: getJsonField(
                                                                                            listarEventosItem,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                        ));
                                                                                      });
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.star_sharp,
                                                                                      color: Color(0xFF161616),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (functions.compareDuasListas(
                                                                                getJsonField(
                                                                                  listarEventosItem,
                                                                                  r'''$.id''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  listarEventosItem,
                                                                                  r'''$.even_ou_imer''',
                                                                                ).toString(),
                                                                                FFAppState().EventosFavoritos.toList()) ==
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.52, -1.01),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 31.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        setState(() {
                                                                                          FFAppState().removeFromEventosFavoritos(EventosFavoritadosStruct(
                                                                                            eventoImersID: getJsonField(
                                                                                              listarEventosItem,
                                                                                              r'''$.id''',
                                                                                            ).toString(),
                                                                                            eventoOuImersao: getJsonField(
                                                                                              listarEventosItem,
                                                                                              r'''$.even_ou_imer''',
                                                                                            ).toString(),
                                                                                          ));
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.star_sharp,
                                                                                        color: Color(0xFFD0D0D0),
                                                                                        size: 22.0,
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
                                                                Expanded(
                                                                  flex: 8,
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x000A0A0A),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(4.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
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
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  getJsonField(
                                                                                    listarEventosItem,
                                                                                    r'''$.descricao''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Giantas Denton',
                                                                                        color: Colors.white,
                                                                                        fontSize: 28.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
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
                                                                                        fontFamily: 'Giantas Denton',
                                                                                        color: Colors.white,
                                                                                        fontSize: 18.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: false,
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
                                                          ),
                                                        ],
                                                      ),
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
            ),
          ),
        ),
      ),
    );
  }
}
