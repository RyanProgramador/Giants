import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filtrar_por_model.dart';
export 'filtrar_por_model.dart';

class FiltrarPorWidget extends StatefulWidget {
  const FiltrarPorWidget({super.key});

  @override
  State<FiltrarPorWidget> createState() => _FiltrarPorWidgetState();
}

class _FiltrarPorWidgetState extends State<FiltrarPorWidget> {
  late FiltrarPorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltrarPorModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        Align(
          alignment: AlignmentDirectional(1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 55.0, 10.0, 0.0),
            child: Container(
              width: 300.0,
              height: 180.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Pesquisar...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);

                                    context.goNamed(
                                      'StaffEventosPArticipados',
                                      queryParameters: {
                                        'isEvento': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                        'dataIni': serializeParam(
                                          '',
                                          ParamType.String,
                                        ),
                                        'dataFin': serializeParam(
                                          '',
                                          ParamType.String,
                                        ),
                                        'pesquisa': serializeParam(
                                          _model.textController.text,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 500),
                                        ),
                                      },
                                    );

                                    FFAppState().update(() {});
                                  },
                                  child: Icon(
                                    Icons.search_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'Filtrar Por',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Data',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              if (_model.data == false)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    setState(() {
                                      _model.data = true;
                                    });
                                    _model.selectedDataRanger =
                                        await actions.selectDateRange(
                                      context,
                                    );
                                    _shouldSetState = true;
                                    setState(() {
                                      _model.data = false;
                                    });
                                    Navigator.pop(context);
                                    if (!(_model.selectedDataRanger?.first !=
                                        null)) {
                                      setState(() {
                                        _model.data = false;
                                      });
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    FFAppState().update(() {});

                                    context.goNamed(
                                      'StaffEventosPArticipados',
                                      queryParameters: {
                                        'isEvento': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                        'dataIni': serializeParam(
                                          _model.selectedDataRanger?.first
                                              ?.toString(),
                                          ParamType.String,
                                        ),
                                        'dataFin': serializeParam(
                                          _model.selectedDataRanger?.last
                                              ?.toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );

                                    setState(() {
                                      _model.data = false;
                                    });
                                    if (_shouldSetState) setState(() {});
                                  },
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
                                ),
                              if (_model.data == true)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.data = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.arrow_drop_up,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              if (true == false)
                                Icon(
                                  Icons.arrow_drop_down,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                              Flexible(
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??= '',
                                  ),
                                  options: List<String>.from(['0', '1']),
                                  optionLabels: ['Aberto', 'Concluido'],
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue = val);
                                    Navigator.pop(context);
                                    FFAppState().update(() {});

                                    context.goNamed(
                                      'StaffEventosPArticipados',
                                      queryParameters: {
                                        'isEvento': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                        'dataIni': serializeParam(
                                          '',
                                          ParamType.String,
                                        ),
                                        'dataFin': serializeParam(
                                          '',
                                          ParamType.String,
                                        ),
                                        'pesquisa': serializeParam(
                                          _model.textController.text,
                                          ParamType.String,
                                        ),
                                        'status': serializeParam(
                                          _model.dropDownValue,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );

                                    FFAppState().update(() {});
                                  },
                                  width: 120.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 32.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Color(0x00E0E3E7),
                                  borderWidth: 0.0,
                                  borderRadius: 0.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
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
  }
}
