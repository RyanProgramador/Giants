import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tela_login_model.dart';
export 'tela_login_model.dart';

class TelaLoginWidget extends StatefulWidget {
  const TelaLoginWidget({Key? key}) : super(key: key);

  @override
  _TelaLoginWidgetState createState() => _TelaLoginWidgetState();
}

class _TelaLoginWidgetState extends State<TelaLoginWidget>
    with TickerProviderStateMixin {
  late TelaLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 630.ms,
          duration: 620.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 560.ms,
          duration: 680.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 880.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 770.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaLoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.lembrarSenha = await actions.lembrarSenha(
        getCurrentTimestamp,
        FFAppState().diaDoUltimoAcesso,
      );
    });

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.senhaController ??= TextEditingController();
    _model.senhaFocusNode ??= FocusNode();
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
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/padro_giants-1-removebg_1_(Traced).png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 30.0),
                            child: Image.asset(
                              'assets/images/Prancheta_5_cpia@4x.png',
                              width: 350.0,
                              height: 150.0,
                              fit: BoxFit.contain,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 30.0),
                            child: Text(
                              'Área de membros',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Giantas Denton',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'E-mail',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Giants',
                                      fontSize: 14.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 20.0),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child: TextFormField(
                                              key: ValueKey('email_cugu'),
                                              controller:
                                                  _model.emailController,
                                              focusNode: _model.emailFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Giants',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.black,
                                                      ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              validator: _model
                                                  .emailControllerValidator
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
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'Senha',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Giants',
                                      fontSize: 14.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 39.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        child: TextFormField(
                                          key: ValueKey('Senha_65qc'),
                                          controller: _model.senhaController,
                                          focusNode: _model.senhaFocusNode,
                                          obscureText: !_model.senhaVisibility,
                                          decoration: InputDecoration(
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Giants',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => _model.senhaVisibility =
                                                    !_model.senhaVisibility,
                                              ),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                _model.senhaVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: Colors.black,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Colors.black,
                                              ),
                                          validator: _model
                                              .senhaControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 20.0),
                            child: FFButtonWidget(
                              key: ValueKey('Button_4ucv'),
                              onPressed: () async {
                                _model.login = await LoginCall.call(
                                  email: _model.emailController.text,
                                  senha: _model.senhaController.text,
                                );
                                if (LoginCall.statusLogin(
                                  (_model.login?.jsonBody ?? ''),
                                )!) {
                                  _model.retornoPorcentagemCFG =
                                      await PorcentagemCFGCall.call();
                                  setState(() {
                                    FFAppState().UsrEmail =
                                        LoginCall.emailLogin(
                                      (_model.login?.jsonBody ?? ''),
                                    )!;
                                    FFAppState().UsrNome = LoginCall.nomeLogin(
                                      (_model.login?.jsonBody ?? ''),
                                    )!;
                                    FFAppState().UsrPicture =
                                        LoginCall.pictureLogin(
                                      (_model.login?.jsonBody ?? ''),
                                    )!;
                                    FFAppState().diaDoUltimoAcesso =
                                        getCurrentTimestamp;
                                    FFAppState().EmailDeSessao =
                                        _model.emailController.text;
                                    FFAppState().SenhaSessao =
                                        _model.senhaController.text;
                                    FFAppState().usrID = LoginCall.iDLogin(
                                      (_model.login?.jsonBody ?? ''),
                                    )!
                                        .toString();
                                    FFAppState().PorcentagemCFG =
                                        PorcentagemCFGCall.porcentagemCFG(
                                      (_model.retornoPorcentagemCFG?.jsonBody ??
                                          ''),
                                    );
                                    FFAppState().UsrClass =
                                        LoginCall.classificacaoLogin(
                                      (_model.login?.jsonBody ?? ''),
                                    )!
                                            .round();
                                  });

                                  context.goNamed(
                                    'Inicio',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 600),
                                      ),
                                    },
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Ops!'),
                                        content: Text(LoginCall.msgLogin(
                                          (_model.login?.jsonBody ?? ''),
                                        )!),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                setState(() {});
                              },
                              text: 'Acessar',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF2B2B2B),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                    ),
                                elevation: 4.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('EsqueciSenha');
                                  },
                                  text: 'Esqueci a senha',
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x004B39EF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ainda não tem cadastro?',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 14.0,
                                ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('CadastroUsuarios');
                            },
                            text: 'Cadastre-se',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 25.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
