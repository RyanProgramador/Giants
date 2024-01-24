import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/menu_mais/meu_perfil/galeriaou_camera/galeriaou_camera_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'meu_perfil_model.dart';
export 'meu_perfil_model.dart';

class MeuPerfilWidget extends StatefulWidget {
  const MeuPerfilWidget({Key? key}) : super(key: key);

  @override
  _MeuPerfilWidgetState createState() => _MeuPerfilWidgetState();
}

class _MeuPerfilWidgetState extends State<MeuPerfilWidget>
    with TickerProviderStateMixin {
  late MeuPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 320.ms,
          hz: 5,
          offset: Offset(0.0, 0.0),
          rotation: 0.052,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeuPerfilModel());

    _model.nomeUserFocusNode ??= FocusNode();

    _model.telefoneFocusNode ??= FocusNode();

    _model.dataNascimentoFocusNode ??= FocusNode();

    _model.nomeCertificadoFocusNode ??= FocusNode();

    _model.nomeCrachaFocusNode ??= FocusNode();

    _model.rgFocusNode ??= FocusNode();

    _model.deficienciaFocusNode ??= FocusNode();

    _model.tempoderedesocialFocusNode ??= FocusNode();

    _model.instragramFocusNode ??= FocusNode();

    _model.linkedinFocusNode ??= FocusNode();

    _model.chocolateFocusNode ??= FocusNode();

    _model.contatoEmergenciaFocusNode ??= FocusNode();

    _model.nomeDeContatoEmergenciaFocusNode ??= FocusNode();

    _model.tamanhoCamisaFocusNode ??= FocusNode();

    _model.tamanhoCaladoFocusNode ??= FocusNode();

    _model.tamanhoSandaliaFocusNode ??= FocusNode();

    _model.tamanhoBermudaFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var _shouldSetState = false;
            _model.resultadoInserirCadastroGeral =
                await InserirOQueFaltaNoCadastroCall.call(
              pesNome: _model.nomeUserController.text,
              pesTelefone: _model.telefoneController.text,
              pesNascimento: _model.dataNascimentoController.text,
              pesNomeCertificado: _model.nomeCertificadoController.text,
              pesNomeCracha: _model.nomeCrachaController.text,
              pesRg: _model.rgController.text,
              pesDeficiente: valueOrDefault<String>(
                _model.switchDeficienteValue == true ? '1' : '0',
                '0',
              ),
              pesChocolatePreferido: _model.chocolateController.text,
              pesContatoEmergencia: _model.contatoEmergenciaController.text,
              pesNomeContatoEmergencia:
                  _model.nomeDeContatoEmergenciaController.text,
              pesTempoRedeSocial: _model.tempoderedesocialController.text,
              pesInstagram: _model.instragramController.text,
              pesDeficiencia: _model.deficienciaController.text,
              pesTamanhoCamisa: _model.tamanhoCamisaController.text,
              pesNumeroCalcado: _model.tamanhoCaladoController.text,
              pesNumeroSandalia: _model.tamanhoSandaliaController.text,
              pesNumeroBermuda: _model.tamanhoBermudaController.text,
              pesId: FFAppState().usrID,
              pesLinkedin: _model.linkedinController.text,
            );
            _shouldSetState = true;
            if (getJsonField(
              (_model.resultadoInserirCadastroGeral?.jsonBody ?? ''),
              r'''$.status''',
            )) {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text(getJsonField(
                      (_model.resultadoInserirCadastroGeral?.jsonBody ?? ''),
                      r'''$.message''',
                    ).toString()),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            } else {
              if (_shouldSetState) setState(() {});
              return;
            }

            if (_shouldSetState) setState(() {});
          },
          backgroundColor: Color(0xFFD0D0D0),
          elevation: 8.0,
          child: Icon(
            Icons.save,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 32.0,
          ),
        ),
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
                              30.0, 0.0, 30.0, 0.0),
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
                            'Meu perfil',
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
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: OQueFaltaCadastrarCall.call(
                        pesId: valueOrDefault<String>(
                          FFAppState().usrID,
                          '1',
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                        final containerOQueFaltaCadastrarResponse =
                            snapshot.data!;
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 130.0,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Stack(
                                                    children: [
                                                      ClipOval(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFF0F0F0F),
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            child: custom_widgets
                                                                .HtmlImageCopyCopy(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              base64Image:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFAppState().UsrPicture !=
                                                                            null &&
                                                                        FFAppState().UsrPicture !=
                                                                            ''
                                                                    ? FFAppState()
                                                                        .UsrPicture
                                                                    : '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',
                                                                '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',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.3, 1.13),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
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
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        GaleriaouCameraWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          text: '',
                                                          icon: Icon(
                                                            Icons.photo_camera,
                                                            color: Color(
                                                                0xFF2B2B2B),
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xFFD0D0D0),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                          ),
                                                          showLoadingIndicator:
                                                              false,
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Nome de usuário',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .nomeUserController ??=
                                                          TextEditingController(
                                                        text:
                                                            OQueFaltaCadastrarCall
                                                                .nomeOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .nomeUserFocusNode,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .nomeUserControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Telefone',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .telefoneController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .telefoneOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .telefoneFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .telefoneControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Data de nascimento',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .dataNascimentoController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .nascimentoOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .dataNascimentoFocusNode,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .datetime,
                                                      validator: _model
                                                          .dataNascimentoControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        _model
                                                            .dataNascimentoMask
                                                      ],
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Nome certificado',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .nomeCertificadoController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .nomeCertificadoOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .nomeCertificadoFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .nomeCertificadoControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Nome para crachá',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .nomeCrachaController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .nomeCrachaOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .nomeCrachaFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .nomeCrachaControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'N° RG',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .rgController ??=
                                                          TextEditingController(
                                                        text:
                                                            OQueFaltaCadastrarCall
                                                                .rgOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode:
                                                          _model.rgFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .rgControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Deficiente?',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          18.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Deficiente',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Switch.adaptive(
                                                  value: _model
                                                          .switchDeficienteValue ??=
                                                      '${OQueFaltaCadastrarCall.deficienteOQFaltaCad(
                                                                containerOQueFaltaCadastrarResponse
                                                                    .jsonBody,
                                                              )?.toString()}' ==
                                                              '0'
                                                          ? false
                                                          : true,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .switchDeficienteValue =
                                                        newValue!);
                                                    if (newValue!) {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation'] !=
                                                          null) {
                                                        setState(() =>
                                                            hasContainerTriggered =
                                                                true);
                                                        SchedulerBinding
                                                            .instance
                                                            .addPostFrameCallback(
                                                                (_) async => animationsMap[
                                                                        'containerOnActionTriggerAnimation']!
                                                                    .controller
                                                                    .forward());
                                                      }
                                                    } else {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation'] !=
                                                          null) {
                                                        setState(() =>
                                                            hasContainerTriggered =
                                                                true);
                                                        SchedulerBinding
                                                            .instance
                                                            .addPostFrameCallback(
                                                                (_) async => animationsMap[
                                                                        'containerOnActionTriggerAnimation']!
                                                                    .controller
                                                                    .forward());
                                                      }
                                                    }
                                                  },
                                                  activeColor: Colors.white,
                                                  activeTrackColor:
                                                      Color(0x4C616161),
                                                  inactiveTrackColor:
                                                      Color(0xFF999999),
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.switchDeficienteValue ?? true)
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Deficiência',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                if (_model.switchDeficienteValue ?? true)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 4.0, 8.0, 8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                                .deficienciaController ??=
                                                            TextEditingController(
                                                          text: OQueFaltaCadastrarCall
                                                              .deficienciaOQFaltaCad(
                                                            containerOQueFaltaCadastrarResponse
                                                                .jsonBody,
                                                          ),
                                                        ),
                                                        focusNode: _model
                                                            .deficienciaFocusNode,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                        validator: _model
                                                            .deficienciaControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ).animateOnActionTrigger(
                                          animationsMap[
                                              'containerOnActionTriggerAnimation']!,
                                          hasBeenTriggered:
                                              hasContainerTriggered),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Tempo de rede social',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .tempoderedesocialController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .tempoRedeSocialOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        )?.toString(),
                                                      ),
                                                      focusNode: _model
                                                          .tempoderedesocialFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .tempoderedesocialControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Instagram',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .instragramController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .instagramOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .instragramFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .instragramControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Linkedin',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .linkedinController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .linkedinOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .linkedinFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .linkedinControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Chocolate preferido',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .chocolateController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .chocolatePreferidoOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .chocolateFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .chocolateControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Contato de emergência',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .contatoEmergenciaController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .contatoEmergenciaOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .contatoEmergenciaFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .contatoEmergenciaControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Nome do contato de emergência',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .nomeDeContatoEmergenciaController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .nomeContatoEmergenciaOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .nomeDeContatoEmergenciaFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .nomeDeContatoEmergenciaControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Tamanho da camisa',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .tamanhoCamisaController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .tamanhoCamisaOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .tamanhoCamisaFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .tamanhoCamisaControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Tamanho do calçado',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .tamanhoCaladoController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .numeroCalcadoOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .tamanhoCaladoFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .tamanhoCaladoControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Tamanho da sandália',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .tamanhoSandaliaController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .numeroSandaliaOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .tamanhoSandaliaFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .tamanhoSandaliaControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Tamanho da bermuda',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                              .tamanhoBermudaController ??=
                                                          TextEditingController(
                                                        text: OQueFaltaCadastrarCall
                                                            .numeroBermudaOQFaltaCad(
                                                          containerOQueFaltaCadastrarResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      focusNode: _model
                                                          .tamanhoBermudaFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: Colors.black,
                                                          ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .tamanhoBermudaControllerValidator
                                                          .asValidator(context),
                                                    ),
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
