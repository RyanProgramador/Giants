import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'listade_acertos_e_erros_model.dart';
export 'listade_acertos_e_erros_model.dart';

class ListadeAcertosEErrosWidget extends StatefulWidget {
  const ListadeAcertosEErrosWidget({
    super.key,
    required this.acertos,
    required this.erros,
  });

  final List<String>? acertos;
  final List<String>? erros;

  @override
  State<ListadeAcertosEErrosWidget> createState() =>
      _ListadeAcertosEErrosWidgetState();
}

class _ListadeAcertosEErrosWidgetState
    extends State<ListadeAcertosEErrosWidget> {
  late ListadeAcertosEErrosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListadeAcertosEErrosModel());
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
      padding: EdgeInsets.all(16.0),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          color: Color(0xFF0F0F0F),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/padro_giants-1-removebg_1_(Traced).png',
            ).image,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.acertos?.length != 0)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  'Entregaveis disponiveis:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Giantas Denton',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 18.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0x002F2F2F),
                ),
                child: Builder(
                  builder: (context) {
                    final acerto = widget.acertos!.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: acerto.length,
                      itemBuilder: (context, acertoIndex) {
                        final acertoItem = acerto[acertoIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            acertoItem,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            if (widget.erros?.length != 0)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Entregaveis que o membro ja possui:',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Giantas Denton',
                        color: Color(0xFFDD3C3C),
                        fontSize: 18.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Builder(
                  builder: (context) {
                    final erros = widget.erros!.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: erros.length,
                      itemBuilder: (context, errosIndex) {
                        final errosItem = erros[errosIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            errosItem,
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
    );
  }
}
