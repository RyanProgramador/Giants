import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_do_qr_code_model.dart';
export 'modal_do_qr_code_model.dart';

class ModalDoQrCodeWidget extends StatefulWidget {
  const ModalDoQrCodeWidget({
    Key? key,
    required this.pesID,
    required this.cargoID,
    required this.eventoID,
    required this.evenOuimer,
  }) : super(key: key);

  final String? pesID;
  final String? cargoID;
  final String? eventoID;
  final String? evenOuimer;

  @override
  _ModalDoQrCodeWidgetState createState() => _ModalDoQrCodeWidgetState();
}

class _ModalDoQrCodeWidgetState extends State<ModalDoQrCodeWidget> {
  late ModalDoQrCodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalDoQrCodeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 270.0,
                  height: 270.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: BarcodeWidget(
                            data:
                                '${widget.eventoID} /// ${widget.pesID} /// ${widget.evenOuimer}',
                            barcode: Barcode.qrCode(),
                            width: 300.0,
                            height: 90.0,
                            color: Colors.white,
                            backgroundColor: Colors.transparent,
                            errorBuilder: (_context, _error) => SizedBox(
                              width: 300.0,
                              height: 90.0,
                            ),
                            drawText: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
