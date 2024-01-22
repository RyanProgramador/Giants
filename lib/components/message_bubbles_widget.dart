import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_bubbles_model.dart';
export 'message_bubbles_model.dart';

class MessageBubblesWidget extends StatefulWidget {
  const MessageBubblesWidget({
    Key? key,
    this.mesageText,
    this.blueBubble,
    this.showDelivered,
    this.showTail,
  }) : super(key: key);

  final String? mesageText;
  final bool? blueBubble;
  final bool? showDelivered;
  final bool? showTail;

  @override
  _MessageBubblesWidgetState createState() => _MessageBubblesWidgetState();
}

class _MessageBubblesWidgetState extends State<MessageBubblesWidget> {
  late MessageBubblesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageBubblesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!widget.blueBubble!)
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      decoration: BoxDecoration(
                        color: Color(0xFF555555),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          widget.mesageText!,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    if (widget.showTail ?? true)
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Image.asset(
                          'assets/images/messageTail.png',
                          width: 8.0,
                          height: 8.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          if (widget.blueBubble ?? true)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      decoration: BoxDecoration(
                        color: Color(0xFFD0D0D0),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.mesageText,
                            'te',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFF303030),
                                  ),
                        ),
                      ),
                    ),
                    if (widget.showTail ?? true)
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Image.asset(
                          'assets/images/messageTailBlue.png',
                          width: 8.0,
                          height: 8.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          if (widget.showDelivered ?? true)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: Text(
                    'Entregue',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Open Sans',
                          color: Color(0xFF717171),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
