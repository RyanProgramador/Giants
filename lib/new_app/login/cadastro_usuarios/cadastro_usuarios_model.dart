import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/modal/termos_de_uso_cad/termos_de_uso_cad_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'cadastro_usuarios_widget.dart' show CadastroUsuariosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CadastroUsuariosModel extends FlutterFlowModel<CadastroUsuariosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode1;
  TextEditingController? nomeController1;
  String? Function(BuildContext, String?)? nomeController1Validator;
  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode2;
  TextEditingController? nomeController2;
  final nomeMask2 = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? nomeController2Validator;
  // State field(s) for celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularController;
  final celularMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? celularControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for Senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (CadastroUsuarios)] action in Button widget.
  ApiCallResponse? cadastra;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    nomeFocusNode1?.dispose();
    nomeController1?.dispose();

    nomeFocusNode2?.dispose();
    nomeController2?.dispose();

    celularFocusNode?.dispose();
    celularController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    senhaFocusNode?.dispose();
    senhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
