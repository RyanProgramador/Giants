import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/menu_mais/meu_perfil/galeriaou_camera/galeriaou_camera_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'meu_perfil_widget.dart' show MeuPerfilWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class MeuPerfilModel extends FlutterFlowModel<MeuPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for NomeUser widget.
  FocusNode? nomeUserFocusNode;
  TextEditingController? nomeUserController;
  String? Function(BuildContext, String?)? nomeUserControllerValidator;
  // State field(s) for telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneController;
  String? Function(BuildContext, String?)? telefoneControllerValidator;
  // State field(s) for data_nascimento widget.
  FocusNode? dataNascimentoFocusNode;
  TextEditingController? dataNascimentoController;
  final dataNascimentoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataNascimentoControllerValidator;
  // State field(s) for nome_certificado widget.
  FocusNode? nomeCertificadoFocusNode;
  TextEditingController? nomeCertificadoController;
  String? Function(BuildContext, String?)? nomeCertificadoControllerValidator;
  // State field(s) for nome_cracha widget.
  FocusNode? nomeCrachaFocusNode;
  TextEditingController? nomeCrachaController;
  String? Function(BuildContext, String?)? nomeCrachaControllerValidator;
  // State field(s) for rg widget.
  FocusNode? rgFocusNode;
  TextEditingController? rgController;
  String? Function(BuildContext, String?)? rgControllerValidator;
  // State field(s) for SwitchDeficiente widget.
  bool? switchDeficienteValue;
  // State field(s) for deficiencia widget.
  FocusNode? deficienciaFocusNode;
  TextEditingController? deficienciaController;
  String? Function(BuildContext, String?)? deficienciaControllerValidator;
  // State field(s) for tempoderedesocial widget.
  FocusNode? tempoderedesocialFocusNode;
  TextEditingController? tempoderedesocialController;
  String? Function(BuildContext, String?)? tempoderedesocialControllerValidator;
  // State field(s) for instragram widget.
  FocusNode? instragramFocusNode;
  TextEditingController? instragramController;
  String? Function(BuildContext, String?)? instragramControllerValidator;
  // State field(s) for linkedin widget.
  FocusNode? linkedinFocusNode;
  TextEditingController? linkedinController;
  String? Function(BuildContext, String?)? linkedinControllerValidator;
  // State field(s) for chocolate widget.
  FocusNode? chocolateFocusNode;
  TextEditingController? chocolateController;
  String? Function(BuildContext, String?)? chocolateControllerValidator;
  // State field(s) for contato_emergencia widget.
  FocusNode? contatoEmergenciaFocusNode;
  TextEditingController? contatoEmergenciaController;
  String? Function(BuildContext, String?)? contatoEmergenciaControllerValidator;
  // State field(s) for nome_de_contato_emergencia widget.
  FocusNode? nomeDeContatoEmergenciaFocusNode;
  TextEditingController? nomeDeContatoEmergenciaController;
  String? Function(BuildContext, String?)?
      nomeDeContatoEmergenciaControllerValidator;
  // State field(s) for tamanho_camisa widget.
  FocusNode? tamanhoCamisaFocusNode;
  TextEditingController? tamanhoCamisaController;
  String? Function(BuildContext, String?)? tamanhoCamisaControllerValidator;
  // State field(s) for tamanho_calado widget.
  FocusNode? tamanhoCaladoFocusNode;
  TextEditingController? tamanhoCaladoController;
  String? Function(BuildContext, String?)? tamanhoCaladoControllerValidator;
  // State field(s) for tamanho_sandalia widget.
  FocusNode? tamanhoSandaliaFocusNode;
  TextEditingController? tamanhoSandaliaController;
  String? Function(BuildContext, String?)? tamanhoSandaliaControllerValidator;
  // State field(s) for tamanho_bermuda widget.
  FocusNode? tamanhoBermudaFocusNode;
  TextEditingController? tamanhoBermudaController;
  String? Function(BuildContext, String?)? tamanhoBermudaControllerValidator;
  // Stores action output result for [Backend Call - API (Inserir o que falta no cadastro)] action in FloatingActionButton widget.
  ApiCallResponse? resultadoInserirCadastroGeral;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nomeUserFocusNode?.dispose();
    nomeUserController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneController?.dispose();

    dataNascimentoFocusNode?.dispose();
    dataNascimentoController?.dispose();

    nomeCertificadoFocusNode?.dispose();
    nomeCertificadoController?.dispose();

    nomeCrachaFocusNode?.dispose();
    nomeCrachaController?.dispose();

    rgFocusNode?.dispose();
    rgController?.dispose();

    deficienciaFocusNode?.dispose();
    deficienciaController?.dispose();

    tempoderedesocialFocusNode?.dispose();
    tempoderedesocialController?.dispose();

    instragramFocusNode?.dispose();
    instragramController?.dispose();

    linkedinFocusNode?.dispose();
    linkedinController?.dispose();

    chocolateFocusNode?.dispose();
    chocolateController?.dispose();

    contatoEmergenciaFocusNode?.dispose();
    contatoEmergenciaController?.dispose();

    nomeDeContatoEmergenciaFocusNode?.dispose();
    nomeDeContatoEmergenciaController?.dispose();

    tamanhoCamisaFocusNode?.dispose();
    tamanhoCamisaController?.dispose();

    tamanhoCaladoFocusNode?.dispose();
    tamanhoCaladoController?.dispose();

    tamanhoSandaliaFocusNode?.dispose();
    tamanhoSandaliaController?.dispose();

    tamanhoBermudaFocusNode?.dispose();
    tamanhoBermudaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
