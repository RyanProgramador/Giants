import '/components/message_bubbles_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'messages_model.dart';
export 'messages_model.dart';

class MessagesWidget extends StatefulWidget {
  const MessagesWidget({super.key});

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  late MessagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessagesModel());

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
        backgroundColor: Color(0x00565656),
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
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
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
                          'Mensagem',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        reverse: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.messageBubblesModel1,
                                updateCallback: () => setState(() {}),
                                child: MessageBubblesWidget(
                                  mesageText: 'Ola!',
                                  blueBubble: true,
                                  showDelivered: true,
                                  showTail: true,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.messageBubblesModel2,
                                updateCallback: () => setState(() {}),
                                child: MessageBubblesWidget(
                                  mesageText: 'Obrigado por tentar Ryan',
                                  blueBubble: true,
                                  showDelivered: true,
                                  showTail: true,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.messageBubblesModel3,
                                updateCallback: () => setState(() {}),
                                child: MessageBubblesWidget(
                                  mesageText: 'Muito bom!',
                                  blueBubble: true,
                                  showDelivered: true,
                                  showTail: true,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.messageBubblesModel4,
                                updateCallback: () => setState(() {}),
                                child: MessageBubblesWidget(
                                  mesageText:
                                      'Teste mensagem longa: kjdsfidsbhfulsdfsdkyfgbkyufkyusgfsuyirfghkyuewnfehnkgkhnigrbvihnk',
                                  blueBubble: true,
                                  showDelivered: true,
                                  showTail: true,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.messageBubblesModel5,
                                updateCallback: () => setState(() {}),
                                child: MessageBubblesWidget(
                                  mesageText: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                  blueBubble: true,
                                  showDelivered: true,
                                  showTail: true,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.messageBubblesModel6,
                                updateCallback: () => setState(() {}),
                                child: MessageBubblesWidget(
                                  mesageText: 'Ola!',
                                  blueBubble: true,
                                  showDelivered: true,
                                  showTail: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Escrever mensagem',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFFD0D0D0),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: null,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: Icon(
                          Icons.send,
                          color: Color(0xFFD0D0D0),
                          size: 40.0,
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
    );
  }
}
