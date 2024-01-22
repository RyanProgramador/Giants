import '/components/message_bubbles_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'messages_widget.dart' show MessagesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MessagesModel extends FlutterFlowModel<MessagesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for messageBubbles component.
  late MessageBubblesModel messageBubblesModel1;
  // Model for messageBubbles component.
  late MessageBubblesModel messageBubblesModel2;
  // Model for messageBubbles component.
  late MessageBubblesModel messageBubblesModel3;
  // Model for messageBubbles component.
  late MessageBubblesModel messageBubblesModel4;
  // Model for messageBubbles component.
  late MessageBubblesModel messageBubblesModel5;
  // Model for messageBubbles component.
  late MessageBubblesModel messageBubblesModel6;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    messageBubblesModel1 = createModel(context, () => MessageBubblesModel());
    messageBubblesModel2 = createModel(context, () => MessageBubblesModel());
    messageBubblesModel3 = createModel(context, () => MessageBubblesModel());
    messageBubblesModel4 = createModel(context, () => MessageBubblesModel());
    messageBubblesModel5 = createModel(context, () => MessageBubblesModel());
    messageBubblesModel6 = createModel(context, () => MessageBubblesModel());
  }

  void dispose() {
    unfocusNode.dispose();
    messageBubblesModel1.dispose();
    messageBubblesModel2.dispose();
    messageBubblesModel3.dispose();
    messageBubblesModel4.dispose();
    messageBubblesModel5.dispose();
    messageBubblesModel6.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
