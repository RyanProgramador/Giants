import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'foto_grande_model.dart';
export 'foto_grande_model.dart';

class FotoGrandeWidget extends StatefulWidget {
  const FotoGrandeWidget({
    Key? key,
    required this.img,
  }) : super(key: key);

  final String? img;

  @override
  _FotoGrandeWidgetState createState() => _FotoGrandeWidgetState();
}

class _FotoGrandeWidgetState extends State<FotoGrandeWidget> {
  late FotoGrandeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FotoGrandeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
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
        decoration: BoxDecoration(
          color: Color(0x77000000),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 400.0,
                decoration: BoxDecoration(
                  color: Color(0x4F2F2F2F),
                  borderRadius: BorderRadius.circular(16.0),
                  shape: BoxShape.rectangle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 300.0,
                    height: double.infinity,
                    child: custom_widgets.HtmlImageCopyCopy(
                      width: 300.0,
                      height: double.infinity,
                      base64Image: widget.img,
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
